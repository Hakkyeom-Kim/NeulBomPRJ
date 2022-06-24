package kopo.poly.service;

public interface IcallapiService {
    // 1.시도 조회
    String callsido() throws Exception;

    // 2.시군구 조회
    String callsigungu() throws Exception;

    // 3.보호소 조회
    String callshelter() throws Exception;

    // 4.품종 조회
    String callkind() throws Exception;

    // 5.유기동물 조회
    String callabandonmentPublic() throws Exception;







}
