package bit.data.dto;


import lombok.Data;

import java.security.Timestamp;

@Data
public class userdto {
    private int usernum;
    private String usertype;
    private String userid;
    private String userpass;
    private String username;
    private String nickname;
    private String photo;
    private String addr;
    private String hp;
    private int lockernum;
    private Timestamp lastlogin;
    private Timestamp birth;
}
