package kopo.poly.controller;

import kopo.poly.dto.ApiDto;
import kopo.poly.dto.SidoDTO;
import kopo.poly.dto.SigunguDTO;
import kopo.poly.service.impl.ApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
public class ApiController {
    private final ApiService apiService;
//시구 , 시군구 이름, 번호 마리아 DB 저장
    @GetMapping("/test22")
    public List<Map<String, Object>> testApi(ModelMap model) throws Exception {
        List<SigunguDTO> sigunguList = new ArrayList<>();

        ApiDto rDto = apiService.test();
        for (Map<String, Object> map : rDto.getItem()) {
            String code1 = (String) map.get("uprCd"); // 시군구상위코드
            String code = (String) map.get("orgCd"); //시군구 코드
            String sidoName = (String) map.get("orgdownNm"); //시군구 이름
            SigunguDTO sDTO = new SigunguDTO();
            sDTO.setUpr_Cd(code1);
            sDTO.setOrg_Cd(code);
            sDTO.setOrgdown_Nm(sidoName);
            sigunguList.add(sDTO);
            sDTO = null;

            System.out.println("code1 : " + (String) map.get("uprCd"));
            System.out.println("code : " + (String) map.get("orgCd"));
            System.out.println("sigungu(do)name : " + (String) map.get("orgdownNm"));
        }

        //db값(list) view jsp에서 for
        //선택한 sido랑 code -> controller
        //sigungu 있으면 호출

        String res = apiService.insertSido(sigunguList);


        model.addAttribute("items", rDto.getItems());


        return rDto.getItem();
    }



}
