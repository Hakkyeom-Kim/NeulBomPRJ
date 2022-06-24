package kopo.poly.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BookDTO {

    private int book_seq; // 예약번호
    private String care_nm; // 보호소 명
    private String care_addr; // 보호소 주소
    private String kind_cd;  // 동물 정보
    private String user_name; // 유저네임
    private String user_id; // 유저 아이디
    private String reg_dt; // 예약시간



}