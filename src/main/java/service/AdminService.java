package service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.CategoryMapper;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminService {
    @Autowired
    private CategoryMapper categoryMapper;

    public PageInfo categoryList(Integer pageNum, Map<String, String[]> condition) {
        int pageSize=5;
        PageHelper.startPage(pageNum,pageSize,true);
        List<Category> categoryList = categoryMapper.showCategory();
        PageInfo<Category> pageInfo=new PageInfo<>(categoryList);
        return pageInfo;
    }

    public int addCategory(Category category) {
        int insert = categoryMapper.insert(category);
        return insert;
    }

    public Category editCategory(Long cid) {
        Category category = categoryMapper.getCategoryById(cid);
        return category;
    }

    public int updateCategory(Category category) {
        int i = categoryMapper.updateByPrimaryKeySelective(category);
        return i;
    }
}
