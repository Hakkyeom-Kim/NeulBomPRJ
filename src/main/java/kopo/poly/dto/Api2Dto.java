package kopo.poly.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Api2Dto {
    private Map<String, Map<String, Object>> response;
    private Map<String, Object> header;
    private Map<String, Object> body;
    private Map<String, Object> items;
    private List<Dto2> item;
 }
