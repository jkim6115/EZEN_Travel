package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.MapDaoImp;
import dto.MapDTO;

@Controller
public class MapController {

	// http://localhost:8090/myapp/mainmap.do

	

		private MapDaoImp dao;
		
		public void setDao(MapDaoImp dao) {
			this.dao = dao;
		}
		
		public MapController() {

		}
		
		@RequestMapping(value="/mainmap.do", method=RequestMethod.GET)
		public String execute() {
			return "/map";
		}
		
		@ResponseBody
		@RequestMapping(value="/mainmap.do", method=RequestMethod.POST)
		public List<MapDTO> process(String data){
			return dao.map_list(data);
		}
		
		
		
	

}
