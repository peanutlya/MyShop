package controller;

import com.google.gson.Gson;
import dao.CategoryMapper;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AjaxControl {
    @Autowired
    CategoryMapper categoryMapper;
    @RequestMapping(value = "/getLevel",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getLevel(long level){
        List<Category> parent = categoryMapper.getParent(level);
        String s = new Gson().toJson(parent);
        System.out.println(s);
        return s;
    }
}
