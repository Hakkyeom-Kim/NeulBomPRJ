package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class DetailController {

    @RequestMapping(value = "/NeulBomService/map")
    public String index() {
        log.info(this.getClass().getName() + "/NeulBomService/map");

        return "/NeulBomService/map";
    }


        @RequestMapping(value = "/NeulBomService/LoSearch")
        public String LoSearch() {
            log.info(this.getClass().getName() + "/NeulBomService/LoSearch");

            return "/NeulBomService/LoSearch";
        }

    @RequestMapping(value = "/notice/FreeNoticeList")
    public String NoticeList1() {
        log.info(this.getClass().getName() + "/Notice/FreeNoticeList1");

        return "/notice/FreeNoticeList";
    }

//    @RequestMapping(value = "/user/MyPage")
//    public String Mypage() {
//        log.info(this.getClass().getName() + "/user/MyPage");
//
//        return "/user/MyPage";
//    }



}
