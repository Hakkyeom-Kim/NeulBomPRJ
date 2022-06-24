package kopo.poly.persistance.mapper;

import kopo.poly.dto.SidoDTO;
import kopo.poly.dto.SigunguDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IApiMapper {

    int insertSidoList(List<SigunguDTO> sidoList) throws Exception;

    List<SidoDTO> getsido() throws Exception;

    List<SigunguDTO> getsigungu() throws Exception;
}
