package bit.data.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bit.data.dto.MemberDto;
import bit.data.service.MemberServiceInter;
import util.ChangeName;

@Controller
@RequestMapping("/member") //앞에 공통적으로 들어가는 매핑 설정
public class MemberController {
	
	@Autowired
	MemberServiceInter memService;
	
	@GetMapping("/list")
	public String mlist(Model model) {
		//총 멤버 인원수를 db에서 얻는다
		int totalCount = memService.getTotalCount();
		//전체 멤버데이터를 가져온다
		List<MemberDto> list = memService.getAllMembers();
			
		//model에 저장을 한다
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "/bit/member/memberlist";
	}
		
	@GetMapping("/form")
	public String mform() {
		return "/bit/member/memberform";
	}
	
	@PostMapping("/insert")
	public String insert(HttpServletRequest request, MemberDto dto, MultipartFile myphoto) {
		// 톰캣에 올라간 upload 폴더 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//저장할 파일명 구하기
		String fileName = ChangeName.getChangeFileName(myphoto.getOriginalFilename());
		//dto의 photo에 저장
		dto.setPhoto(fileName);
		
		//upload
		try {
			myphoto.transferTo(new File(path + "/" + fileName));
			
			//db insert
			memService.insertMember(dto);
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:list"; // /member/list 매핑주소 호출 - 컨트롤러 메서드 호출
	}
	
	//아이디 체크하는 메서드
	@GetMapping("/idcheck")
	@ResponseBody //json 반환
	public Map<String, Integer> getSearchId(String id) {
		Map<String, Integer> map = new HashMap<>();
		
		int count = memService.getSearchId(id); //아이디가 있을 경우 1, 없을 경우 0 반환
		map.put("count", count);
		
		return map;
	}
	
	@PostMapping("/updatephoto")
	@ResponseBody
	public void photoUpload(int num, MultipartFile photo, HttpServletRequest request, HttpSession session){
		//업로드될 경로 구하기
		String path = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(path);
		//업로드할 파일명 구하기(현재날짜로 파일명 변경)
		String fileName = ChangeName.getChangeFileName(photo.getOriginalFilename());
		
		//업로드
		try {
			photo.transferTo(new File(path + "/" + fileName));
			memService.updatePhoto(num, fileName); //db에서 사진 수정
			session.setAttribute("loginphoto", fileName); //세션의 사진 변경
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//삭제
	@GetMapping("/delete")
	@ResponseBody
	public void delete(int num, HttpSession session) {
		memService.deleteMember(num);
		//로그인한 본인 삭제 후 모든 세션 지우기
		session.removeAttribute("loginok");
		session.removeAttribute("loginid");
		session.removeAttribute("loginname");
		session.removeAttribute("loginphoto");
	}
	
	//수정폼에 출력할 데이터 반환
	@GetMapping("/updateform")
	@ResponseBody
	public MemberDto getData(int num) {
		return memService.getDataByNum(num);
	}
	
	//수정
	@PostMapping("/update")
	@ResponseBody
	public void update(MemberDto dto, HttpSession session) {
		memService.updateMember(dto);
		//세션에 저장된 이름도 변경하기
		session.setAttribute("loginname", dto.getName());
	}
}










