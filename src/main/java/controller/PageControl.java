package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageControl {
    @RequestMapping("/admin/index")
    public String adminindex(){
        return "admin/index";
    }

    @RequestMapping("/admin/addCategory")
    public String adminaddcategory(){
        return "admin/addCategory";
    }

    @RequestMapping("/admin/editCategory")
    public String admineditcategory(){
        return "admin/editCategory";
    }
}
