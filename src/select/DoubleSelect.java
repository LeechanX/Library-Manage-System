package select;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class DoubleSelect {
	
	Map<Type, List<Type2>> map = new HashMap <Type, List<Type2>>();
	
	
	
	HttpServletRequest request=ServletActionContext.getRequest();
	
	public void doubleselect(){
		Type t1=new Type();
		Type t2=new Type();
		Type t3=new Type();
		Type t4=new Type();
		Type t5=new Type();
		t1.setTypename("科技");
		t2.setTypename("文学");
		t3.setTypename("杂志");
		t4.setTypename("工具书");
		t5.setTypename("其他");
		
		List <Type2> type2list1=new ArrayList<Type2>();
		Type2 t11=new Type2();
		Type2 t12=new Type2();
		Type2 t13=new Type2();
		Type2 t14=new Type2();
		Type2 t15=new Type2();
		Type2 t16=new Type2();
		Type2 t17=new Type2();
		
		t11.setType2_id(1);
		t11.setValue("建筑");
		t12.setType2_id(2);
		t12.setValue("计算机");
		t13.setType2_id(3);
		t13.setValue("机械");
		t14.setType2_id(4);
		t14.setValue("电气");
		t15.setType2_id(5);
		t15.setValue("土木");
		t16.setType2_id(6);
		t16.setValue("热能");
		t17.setType2_id(7);
		t17.setValue("航天");
		type2list1.add(t11);
		type2list1.add(t12);
		type2list1.add(t13);
		type2list1.add(t14);
		type2list1.add(t15);
		type2list1.add(t16);
		type2list1.add(t17);
		
		List <Type2> type2list2=new ArrayList<Type2>();
		
		Type2 t21=new Type2();
		Type2 t22=new Type2();
		Type2 t23=new Type2();
		
		t21.setType2_id(1);
		t21.setValue("小说");
		t22.setType2_id(2);
		t22.setValue("散文");
		t23.setType2_id(3);
		t23.setValue("传记");
		type2list2.add(t21);
		type2list2.add(t22);
		type2list2.add(t23);
		
        List <Type2> type2list3=new ArrayList<Type2>();
		
		Type2 t31=new Type2();
		Type2 t32=new Type2();
		Type2 t33=new Type2();
		
		t31.setType2_id(1);
		t31.setValue("月刊");
		t32.setType2_id(2);
		t32.setValue("期刊");
		t33.setType2_id(3);
		t33.setValue("周报");
		type2list3.add(t31);
		type2list3.add(t32);
		type2list3.add(t33);
		
        List <Type2> type2list4=new ArrayList<Type2>();
		
		Type2 t41=new Type2();
		Type2 t42=new Type2();
		
		t41.setType2_id(1);
		t41.setValue("字典");
		t42.setType2_id(2);
		t42.setValue("词汇");
		
		type2list4.add(t41);
		type2list4.add(t42);

        List <Type2> type2list5=new ArrayList<Type2>();
		
		Type2 t51=new Type2();
		Type2 t52=new Type2();
		Type2 t53=new Type2();
		
		t51.setType2_id(1);
		t51.setValue("画册");
		t52.setType2_id(2);
		t52.setValue("书法");
		t53.setType2_id(3);
		t53.setValue("其余");
		type2list5.add(t51);
		type2list5.add(t52);
		type2list5.add(t53);
		
		map.put(t1, type2list1);
		map.put(t2, type2list2);
		map.put(t3, type2list3);
		map.put(t4, type2list4);
		map.put(t5, type2list5);
		
		request.setAttribute("map",map);
		
	}
}
