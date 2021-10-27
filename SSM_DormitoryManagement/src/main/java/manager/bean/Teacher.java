package manager.bean;

public class Teacher {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private String num;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.name
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.gender
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private String gender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.faculties
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private String faculties;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.phoneNum
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private String phonenum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column teacher.dorm_num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    private Integer dormNum;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.num
     *
     * @return the value of teacher.num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public String getNum() {
        return num;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.num
     *
     * @param num the value for teacher.num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setNum(String num) {
        this.num = num == null ? null : num.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.name
     *
     * @return the value of teacher.name
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.name
     *
     * @param name the value for teacher.name
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.gender
     *
     * @return the value of teacher.gender
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public String getGender() {
        return gender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.gender
     *
     * @param gender the value for teacher.gender
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.faculties
     *
     * @return the value of teacher.faculties
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public String getFaculties() {
        return faculties;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.faculties
     *
     * @param faculties the value for teacher.faculties
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setFaculties(String faculties) {
        this.faculties = faculties == null ? null : faculties.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.phoneNum
     *
     * @return the value of teacher.phoneNum
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public String getPhonenum() {
        return phonenum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.phoneNum
     *
     * @param phonenum the value for teacher.phoneNum
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum == null ? null : phonenum.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column teacher.dorm_num
     *
     * @return the value of teacher.dorm_num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public Integer getDormNum() {
        return dormNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column teacher.dorm_num
     *
     * @param dormNum the value for teacher.dorm_num
     *
     * @mbg.generated Mon Sep 27 19:30:10 CST 2021
     */
    public void setDormNum(Integer dormNum) {
        this.dormNum = dormNum;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "num='" + num + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", faculties='" + faculties + '\'' +
                ", phonenum='" + phonenum + '\'' +
                ", dormNum=" + dormNum +
                '}';
    }
}