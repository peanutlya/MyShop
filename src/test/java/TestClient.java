import dao.CategoryMapper;
import entity.Category;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestClient {
    ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
    SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) ac.getBean("sqlSessionFactory");;
    @Test
    public void test(){
        SqlSession session = sqlSessionFactory.openSession();
        CategoryMapper mapper = session.getMapper(CategoryMapper.class);
        List<Category> categoryList = mapper.showCategory();
        for (Category category : categoryList) {
            System.out.println(category);
        }
    }
    @Test
    public void testGetParent(){
        SqlSession session = sqlSessionFactory.openSession();
        CategoryMapper mapper = session.getMapper(CategoryMapper.class);
        List<Category> parent = mapper.getParent(1L);
        if(parent.size()==0){
            System.out.println("is null");
        }
        for (Category category : parent) {
            System.out.println(category);
        }
    }
    @Test
    public void testGetCategoryById(){
        SqlSession session = sqlSessionFactory.openSession();
        CategoryMapper mapper = session.getMapper(CategoryMapper.class);
        Category categoryById = mapper.getCategoryById(1L);
        System.out.println(categoryById.getBelong());
    }
    @Test
    public void testCategoryUpdate(){
        SqlSession session = sqlSessionFactory.openSession();
        CategoryMapper mapper = session.getMapper(CategoryMapper.class);
    }
}
