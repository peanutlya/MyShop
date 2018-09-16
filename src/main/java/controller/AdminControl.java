package controller;

import com.github.pagehelper.PageInfo;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.AdminService;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminControl {
    @Autowired
    private AdminService adminService;
    @RequestMapping("/category/list")
    public String CategoryList(HttpServletRequest request,@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum){
        Map<String, String[]> condition = request.getParameterMap();
        PageInfo pageInfo= adminService.categoryList(pageNum, condition);
        request.setAttribute("condition",condition);
        request.setAttribute("pageInfo",pageInfo);
        request.setAttribute("mainPage","categoryManage.jsp");
        return "admin/index";
    }
    @RequestMapping("/category/add")
    public String CategoryAdd(Category category){
        int i=adminService.addCategory(category);
        return "admin/index";
    }
    @RequestMapping("/category/edit")
    public String CategoryEdit(HttpServletRequest request,Long cid){
        Category category=adminService.editCategory(cid);
        request.setAttribute("category",category);
        return "admin/editCategory";
    }
    @RequestMapping("/category/update")
    public String CategoryUpdate(Category category){
        int i=adminService.updateCategory(category);
        return "admin/index";
    }
}
