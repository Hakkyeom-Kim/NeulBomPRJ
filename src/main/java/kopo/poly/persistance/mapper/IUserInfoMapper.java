package kopo.poly.persistance.mapper;

import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface IUserInfoMapper {


    // 회원 가입하기(회원정보 등록하기)
    int insertUserInfo(UserInfoDTO pDTO) throws Exception;

    // 회원 가입 전 중복체크하기(DB조회하기)
    UserInfoDTO getUserExists(UserInfoDTO pDTO) throws Exception;

    // 로그인 할때 아이디 패스워드 조회
    UserInfoDTO getUserLoginCheck(UserInfoDTO pDTO) throws Exception;

    //비밀번호 찾을때 아이디 일치하는지 확인
    UserInfoDTO forgetPassword(UserInfoDTO pDTO) throws Exception;

    //비번 변경
    void updatePassword(UserInfoDTO pDTO) throws Exception;

    UserInfoDTO getUserInfo(UserInfoDTO pDTO) throws Exception;
    // 아이디 체크
    int idCheck(String user_id) throws Exception;

    // 마이페이지 정보 수정
    void Updatemypage(UserInfoDTO pDTO) throws Exception;

    //회원탈퇴
    void deleteUser(UserInfoDTO dDTO) throws Exception;

}

