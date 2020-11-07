package com.study.aws.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.study.aws.model.dto.answerDto;
import com.study.aws.model.dto.domainDto;
import com.study.aws.model.dto.resultDto;
import com.study.aws.model.service.answerService;

@Controller
@RequestMapping("/answer")
public class answerController {

	@Autowired
	private answerService ser;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam HashMap<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		String name = map.get("name");
		ModelAndView mv = new ModelAndView();
		if (name.equals("재희") || name.equals("홍균") || name.equals("지환") || name.equals("유창")) {
			session.setAttribute("name", name);

//			Cookie cookie = new Cookie("name", name);
//			cookie.setPath("/");
//			response.addCookie(cookie);

			System.out.println(name);
//			mv.addObject("name", name);
			mv.setViewName("home");

		} else {
			model.addAttribute("msg", "이름이 잘못됨");
			mv.setViewName("home");
		}
		return mv;
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	public @ResponseBody List<resultDto> list(@RequestBody domainDto domain, HttpServletRequest request,
			HttpSession session) {
		System.out.println(domain.toString());
		try {
			List<answerDto> result = ser.selectAll(domain);
			return ListToResult(result, domain);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	private List<resultDto> ListToResult(List<answerDto> result, domainDto domain) {
		int start = Integer.parseInt(domain.getStartNum());
		int end = Integer.parseInt(domain.getEndNum());
		List<resultDto> list = new ArrayList<resultDto>();

		String han, hong, choi, you;
		answerDto tmp;
		for (int i = start; i <= end; i++) {
			resultDto r = new resultDto();
			r.setAnswerNum(Integer.toString(i));
			han = "";
			hong = "";
			choi = "";
			you = "";
			for (int j = 0; j < result.size(); j++) {
				tmp = result.get(j);
				if (i == tmp.getAnswerNum()) {
					if (tmp.getName().equals("재희"))
						han = tmp.getAnswer();
					else if (tmp.getName().equals("홍균"))
						hong = tmp.getAnswer();
					else if (tmp.getName().equals("유창"))
						you = tmp.getAnswer();
					else
						choi = tmp.getAnswer();
				}
			}
			r.setAnswers(new String[] { han, hong, choi, you });

			if (han.equals("") || hong.equals("") || choi.equals("") || you.equals(""))
				r.setMatched("X");
			else if (han.equals(hong) && hong.equals(choi) && choi.equals(you))
				r.setMatched("O");
			else
				r.setMatched("X");
			list.add(r);
		}
		return list;
	}

	@RequestMapping(value = "/userpage", method = RequestMethod.GET)
	public String listOfName() {
		return "userpage";
	}

	@RequestMapping(value = "/userpage", method = RequestMethod.POST)
	public String listOfName(HashMap<String, String> map, Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.setAttribute("name", map.get("name"));
		// map : name, startNum, endNum
		map.put("startNum", "0");
		map.put("endNum", "500");
		System.out.println(map.get("name"));
		System.out.println(map.get("startNum"));
		System.out.println(map.get("endNum"));
		try {
			List<answerDto> result = ser.selectUserAnswers(map);
			System.out.println(result.size());
			model.addAttribute("answerList", result);
			model.addAttribute("name", map.get("name"));
			return "userpage";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "문제가져오기 실패");
			return "error";
		}
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String registerGET() {
		return "register";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String registerPOST(@RequestBody HashMap<String, Object> param) {
		System.out.println("here");

		JsonObject obj = new JsonObject();
		try {
			String name = (String) param.get("name");
			int startNum = (Integer) param.get("startNum");
			ArrayList<String> answers = (ArrayList<String>) param.get("answers");

			for (int i = 0; i < 40; i++) {
				if (answers.get(i).equals(""))
					continue;
				ser.register(new answerDto(name, startNum + i, answers.get(i)));
			}
			obj.addProperty("status", "success");
			obj.addProperty("code", "200");

		} catch (Exception e) {
			e.printStackTrace();
			obj.addProperty("status", "실패");
			obj.addProperty("code", "500");
		}

		return obj.toString();

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
