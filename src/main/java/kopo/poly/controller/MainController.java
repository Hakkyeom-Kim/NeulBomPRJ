package kopo.poly.controller;

import kopo.poly.dto.*;
import kopo.poly.service.IApiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.net.URI;
import java.util.List;
import java.util.Map;

import static org.springframework.http.HttpMethod.GET;

@Slf4j
@Controller
public class MainController {
    @Resource(name = "ApiService")
    private IApiService apiService;



    @RequestMapping(value = "index")
    public String index() {
        log.info(this.getClass().getName() + ".index(Main Page) ok!");

        return "index";
    }

    @RequestMapping(value = "NeulBomService/animaldetail")
    public String animaldetail(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".NeulBomService/animaldetail ok!");
        String animalInfoJSON = request.getParameter("animalInfoJSON");
        log.info("JSON : " + animalInfoJSON);
        model.addAttribute("JSON", animalInfoJSON);
        return "/NeulBomService/animaldetail";
    }

//    @RequestMapping(value = "/user/ForgetPasswordForm")
//    public String ForgetPasswordForm() {
//        log.info(this.getClass().getName() + "./user/ForgetPasswordForm ok!");
//
//        return "/user/ForgetPasswordForm";
//    }

    @RequestMapping(value = "user/UserRegForm1")
    public String UserRegFrom1() {
        log.info(this.getClass().getName() + ".user/UserRegForm1 ok!");

        return "/user/UserRegForm1";
    }

    @RequestMapping(value = "NeulBomService/animalsearch")
    public String animalsearchPage(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".user/animalsearchPage ok!");

        List<SidoDTO> rList = apiService.getSido();
        model.addAttribute("SidoDTOList", rList);

        List<SigunguDTO> sList = apiService.getsigungu();
        if(sList == null) {
            log.info("널입니다.");
        } else {
            log.info(String.valueOf(sList.size()));
        }
        model.addAttribute("SigunguDTOList", sList);

        return "/NeulBomService/animalsearch";
    }

    @RequestMapping(value = "/animalsearch")
    @ResponseBody
    public ApiDto animalsearch(ModelMap model, HttpServletRequest request) throws Exception {

        ApiDto rDoDto = new ApiDto();

        try {
            log.info(this.getClass().getName() + ".NeulBomService/animalsearch OK!");

            String upr_cd = "";

            upr_cd += request.getParameter("sidoCode");
            log.info("upr_cd : " + upr_cd);
            String org_cd = "";
            org_cd += request.getParameter("sigunguCode");
            log.info("org_cd : " + org_cd);
            String kind_cd = request.getParameter("animalCode");
            log.info("kind_cd : " + kind_cd);
            String pageNo = request.getParameter("pageNo");
            log.info("pageNo : " + pageNo);
            String numOfRows = request.getParameter("numOfRows");

            boolean succees = false;

            URI url = new URI("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?&serviceKey=oGn1LW9G5ptAZCqIWd1z1fnjwqVXkRRyFdhfNYf8CdMZF9VhGwzGKsgn1f22tS6LP3W3RBpIDQt63IidB%2BhO9A%3D%3D&_type=JSON&upr_cd=" + upr_cd + "&org_cd=" + org_cd + "&upkind=" + kind_cd + "&pageNo=" + pageNo + "&numOfRows=" + 12);

            ResponseEntity<ApiDto> response = new RestTemplate().exchange(url, GET, null, ApiDto.class);

            int cnt = 1;

            while (!succees && cnt < 11) {

                cnt++;
                if (response == null) {
                    url = new URI("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic?&serviceKey=oGn1LW9G5ptAZCqIWd1z1fnjwqVXkRRyFdhfNYf8CdMZF9VhGwzGKsgn1f22tS6LP3W3RBpIDQt63IidB%2BhO9A%3D%3D&_type=JSON&upr_cd=" + upr_cd + "&org_cd=" + org_cd + "&upkind=" + kind_cd + "&pageNo=" + pageNo + "&numOfRows=" + 12);

                    response = new RestTemplate().exchange(url, GET, null, ApiDto.class);

                } else {
                    //ResponseEntity<ApiDto> response = restTemplate.exchange(uri, HttpMethod.GET, null, ApiDto.class);
                    rDoDto.setHeader(response.getBody().getResponse().get("header"));
                    rDoDto.setBody(response.getBody().getResponse().get("body"));
                    rDoDto.setItems((Map<String, Object>) rDoDto.getBody().get("items"));
                    rDoDto.setItem((List<Map<String, Object>>) rDoDto.getItems().get("item"));

                    succees = true;
                }
            }

        } catch (HttpStatusCodeException statusCodeException) {
            int code = statusCodeException.getRawStatusCode();
            log.info("code : " + code);
            log.info("Ex : " + statusCodeException);

        } catch (Exception exception) {
            log.info("Exception  : " + exception);

        } finally {

            return rDoDto;

        }





    }

    @RequestMapping(value = "/animalInfo")
    public String animalInfo(HttpServletRequest request) throws Exception {
        log.info("animalInfo start");

        String filename = request.getParameter("filename");
        String noticeNo = request.getParameter("noticeNo");
        log.info("filename : " + filename);
        log.info("noticeNo : " + noticeNo);

        return "/";

    }
}
