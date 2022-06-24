package kopo.poly.service;

import kopo.poly.dto.ApiDto;
import kopo.poly.dto.SidoDTO;
import kopo.poly.dto.SigunguDTO;

import java.util.List;

public interface IApiService {
     ApiDto test() throws Exception;

    String insertSido(List<SigunguDTO> pDTO) throws Exception;

    List<SidoDTO> getSido() throws Exception;

    List<SigunguDTO> getsigungu() throws Exception;
}
