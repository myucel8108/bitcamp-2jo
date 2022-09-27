package bit.data.dao;

import java.util.List;

import bit.data.dto.BoardAnswerDto;

public interface BoardAnswerDaoInter {
	public List<BoardAnswerDto> getAllAnswerList(int num);
	public void insertAnswer(BoardAnswerDto dto);
	public BoardAnswerDto getAnswer(int idx);
	public void deleteAnswer(int idx);
}
