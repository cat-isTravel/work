package ssm.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import ssm.bean.Department;
import ssm.bean.DepartmentExample;
public interface DepartmentMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    long countByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int deleteByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int insert(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int insertSelective(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    List<Department> selectByExample(DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    Department selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int updateByPrimaryKeySelective(Department record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tb1_dept
     *
     * @mbg.generated Tue Aug 24 09:21:20 CST 2021
     */
    int updateByPrimaryKey(Department record);
}