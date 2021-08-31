package com.example.utils;

import org.apache.commons.beanutils.BeanUtils;
import java.util.Map;

public class WebUtils {
    public static <T>T copyParamToBean(Map values,T t){
        try {
            BeanUtils.populate(t, values);
            return t;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static Integer parseInt(String str ,Integer defaultValues){
        try {
            int i = Integer.parseInt(str);
            return i;
        } catch (NumberFormatException e) {
//            e.printStackTrace();
        }
        return defaultValues;
    }
}
