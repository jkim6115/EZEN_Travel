package com.ezentravel.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezentravel.DAO.MapDaoImp;
import com.ezentravel.DTO.MapDTO;
import com.ezentravel.DTO.UsDTO;

//http://localhost:8090/controller/mainmap.do
//http://localhost:8090/controller/rankmap.do

@Controller
public class MapController {
		
		@Autowired
		private MapDaoImp dao;
		
		public void setDao(MapDaoImp dao) {
			this.dao = dao;
		}
		
		public MapController() {

		}
		
		@RequestMapping(value={"/", "/mainmap.do", "/rankmap.do"}, method=RequestMethod.GET)
		public String execute(@RequestParam(value="tag_num",  required = false) String tag_num) {
			return "/map";
		}
		
		@ResponseBody
		@RequestMapping(value="/mainmap.do", method=RequestMethod.POST)
		public List<MapDTO> process(String data){
			return dao.map_list(data);
		}
		
		@ResponseBody
		@RequestMapping(value="/rankmap.do", method=RequestMethod.POST)
		public List<MapDTO> rank_process() {
			return dao.map_rank();
		}
		
		@ResponseBody
		@RequestMapping(value="/tagsmap.do", method=RequestMethod.POST)
		public List<MapDTO> tags_process(int tag_num) {
			return dao.tag_list(tag_num);
		}
		
		@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
		public String detail_execute(@RequestParam("area_num") String area_num, Model model) {
			dao.map_readcount(Integer.parseInt(area_num));
			model.addAttribute("area_num", area_num);
			return "/detail";
		}
		
		@ResponseBody
		@RequestMapping(value = "/detail.do", method = RequestMethod.POST)
		public MapDTO detail_process(String area_num) {
			return dao.map_detail(Integer.parseInt(area_num));
		}
		
		@ResponseBody
		@PostMapping("/login.do")
		public ModelAndView login_process(@ModelAttribute UsDTO usDTO, HttpSession httpSession) {
			ModelAndView mv = new ModelAndView("redirect:/mainmap.do");
			
			httpSession.setAttribute("user_num", usDTO.getUser_num());
			httpSession.setAttribute("nickname", usDTO.getNickname());
			
			int result = dao.user_select(usDTO);
			System.out.println(result);
			if (result == 0) {
				dao.user_insert(usDTO);
				return mv;
			} else {
				return mv;
			}
		}
		
		@ResponseBody
		@PostMapping("/secession.do")
		public ModelAndView secession_process(@ModelAttribute UsDTO usDTO) {
			ModelAndView mv = new ModelAndView("redirect:/mainmap.do");
			
			dao.user_delete(usDTO);
			return mv;
		
		}
		
		@RequestMapping(value = "/intro.do", method = RequestMethod.GET)
		public String intro_process() {
			return "/intro";
		}
}
