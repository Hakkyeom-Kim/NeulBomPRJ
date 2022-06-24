package kopo.poly.service.impl;

import kopo.poly.dto.ApiDto;
import kopo.poly.dto.SidoDTO;
import kopo.poly.dto.SigunguDTO;
import kopo.poly.persistance.mapper.IApiMapper;
import kopo.poly.service.IApiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.List;
import java.util.Map;

@Service("ApiService")
@Slf4j
public class ApiService implements IApiService {

    private final IApiMapper Api;

    public ApiService(IApiMapper Api) {
        this.Api = Api;
    }

    public ApiDto test() throws Exception {
        log.info("test Start!");
        RestTemplate restTemplate = new RestTemplate();

        ApiDto rDoDto = new ApiDto();

       // String url = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/shelter?upr_cd=" + 6110000 + "&org_cd=" + 3220000 + "&serviceKey=인증키(URL Encode)";

        URI uri = new URI("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/sigungu?upr_cd=6500000&serviceKey=oGn1LW9G5ptAZCqIWd1z1fnjwqVXkRRyFdhfNYf8CdMZF9VhGwzGKsgn1f22tS6LP3W3RBpIDQt63IidB%2BhO9A%3D%3D&_type=JSON");
        ResponseEntity<ApiDto> response = restTemplate.exchange(uri, HttpMethod.GET, null, ApiDto.class);

        rDoDto.setHeader(response.getBody().getResponse().get("header"));
        rDoDto.setBody(response.getBody().getResponse().get("body"));
        rDoDto.setItems((Map<String, Object>) rDoDto.getBody().get("items"));
        rDoDto.setItem((List<Map<String, Object>>) rDoDto.getItems().get("item"));

        return rDoDto;

    }

    public String insertSido(List<SigunguDTO> pDTO) throws Exception {
        Api.insertSidoList(pDTO);

        return "1";
    }


    //시도를 가져온다
    public List<SidoDTO> getSido() throws Exception {

        List<SidoDTO> rDTO = Api.getsido();

        return rDTO;
    }

    //시군구를 가져온다
    public List<SigunguDTO> getsigungu() throws Exception {

        List<SigunguDTO> rDTO = Api.getsigungu();

        return rDTO;
    }


}
