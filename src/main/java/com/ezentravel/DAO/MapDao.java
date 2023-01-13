package com.ezentravel.DAO;
import java.util.List;

import com.ezentravel.DTO.MapDTO;
import com.ezentravel.DTO.UserDTO;

public interface MapDao {

	public List<MapDTO> map_list(String data);
	public List<MapDTO> map_rank();
	public MapDTO map_detail(int area_num);
	public int map_readcount(int area_num);
	public List<MapDTO> tag_list(int tag_num);
	
	public int user_insert(UserDTO userDTO);
}
