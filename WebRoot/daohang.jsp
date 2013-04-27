<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head><link rel="stylesheet" style="text/css" href="CSS/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>图书馆导航</title>
		<style>
		div#myModal{
		width:500px;
		}
		</style>
	</head>
	<body>
		<img src="<%=path%>/Images/3f.jpg"
			usemap="#3fmap" alt="3f">
		<map name="3fmap" id="3fmap">
			<area shape="rect" coords="26,23,238,144" href="#myModal1" data-toggle="modal"
				target="_blank" alt="dianzijieyueshi" />
			<area shape="rect" coords="28,453,111,570" href="#myModal2" data-toggle="modal"
				target="_blank" alt="tushuqu" />
			<area shape="rect" coords="800,432,878,542" href="#myModal3" data-toggle="modal"
				target="_blank" alt="tushuqu" />
			<area shape="rect" coords="744,39,866,157" data-toggle="modal"
				href="#myModal4" target="_blank" alt="tushuqu" />
			<area shape="rect" coords="340,300,540,360" data-toggle="modal"
				href="#myModal5" target="_blank" alt="huanshuqu" />
		</map>
		<div id="myModal1" class="modal hide fade in">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				电子阅览室
			</div>
			 <div class="modal-body">
    <img src="<%=path%>/Images/dianzijieyueshi.jpg" width="300px" height="300px"/><p>电子阅览室的硬件系统主要由服务器、大容量的存储设备、网络传输与交换系统、用户终端等构成。一般应配置多媒体计算机、internet信息服务器、磁盘阵列、交换机，网卡、超五类双绞线、打印扫描投影等设备。对于主服务器存储系统、交换机等关键设备最好选取比较成熟、先进、易扩充和性价比较高的品牌机。
电子阅览室的软件系统包括服务器操作系统、客户端操作软件、防火墙等。网络服务器的平台应选择开放性、兼容性、安全性好，管理简便灵活的操作系统，目前很多电子阅览室一般采用Netware和Windows NT。
    </p>
  </div>
			<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
		</div>
		<div id="myModal2" class="modal hide fade in">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				图书区（西南）
			</div>
			 <div class="modal-body">
    <img src="<%=path%>/Images/tushuqu1.jpg" width="300px" height="300px"/><p>
    图书馆进行社会教育，主要表现在可以为社会、为读者提供最完备的学习条件：资源、场地、设备。受教育者可以长期的、自由地利用图书馆进行自学。它还是学校教育的重要组成部分。在学校里，图书馆是基本的教育设施，它被誉为“知识的宝库、知识的喷泉”，“大学的心脏”，“学校的第二课堂”，直接承担着培养人才的重任。　
书馆向社会所有成员敞开大门，教育他们如何才能获取文献资源的过程和方法，掌握进行终身学习所必须的技能。
    </p>
  </div>
			<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
		</div>
		<div id="myModal3" class="modal hide fade in">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				图书区（东南）
			</div>
			 <div class="modal-body">
    <img src="<%=path%>/Images/tushuqu2.jpg" width="300px" height="300px"/><p>文献典藏主要包括书库划分 (见馆藏组织)、图书排列 (见同类图书排列法)、馆藏清点和文献保护等。其中，文献保护是一项专门技术，包括图书装订、修补、防火、防潮、防光、防霉和防虫以及防止机械性损伤等。</p>
  </div>
			<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
		</div>
		<div id="myModal4" class="modal hide fade in">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				图书区（东北）
			</div>
			 <div class="modal-body">
    <img src="<%=path%>/Images/tushuqu3.jpg" width="300px" height="300px"/><p>
    文献整理包括文献的分类、主题标引、著录和目录组织等内容。文献分类不仅为编制分类目录和文献排架提供依据，也便于图书馆统计、新书宣传、参考咨询和文献检索等。文献主题标引是根据文献内容所讨论的主题范围，以主题词来揭示和组织文献的。文献分类和主题标引是揭示文献内容的重要手段，文献著录则是全面地、详尽地揭示文献形式特征和内容特征的主要手段，它便于读者依据该文献的各种特征确认某种文献，获得所需文献的线索。图书馆员把各种款目有序地组织成图书馆目录(见目录组织法)，以揭示图书馆馆藏,图书馆目录是检索文献的工具,也是打开图书馆这个知识宝库的钥匙。
    </p>
  </div>
			<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
		</div>
		<div id="myModal5" class="modal hide fade in">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				借还书区
			</div>
			 <div class="modal-body">
    <img src="<%=path%>/Images/huanshuqu.jpg" width="300px" height="300px"/><p>
· 持有优待证的老年读者和残疾人读者可优先借阅；
· 随身携带的包、饮用水、及其它与借阅无关的物品请凭有效读者卡或身份证免费寄放到存包处；
· 注意仪表着装，请勿穿汗背心、趿拖鞋入馆；
· 请勿在馆区内吸烟和使用明火,请勿带易燃、易爆品入馆；
· 请在指定地点就餐、饮水，请勿携带食品、饮用水入馆；
· 请勿在馆内娱乐和从事交易等与查阅书刊资料无关的活动；
· 请保持馆区安静，入室请将移动通讯设备置于静音状态；
· 请自觉遵守公共秩序和国家图书馆各项管理规定，服从工作人员管理。
    </p>
  </div>
			<div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
		</div>
		<script>
		$('#myModal1').modal(options)
		$('#myModal2').modal(options)
		$('#myModal3').modal(options)
		$('#myModal4').modal(options)
		$('#myModal5').modal(options)
		</script>
	</body>
</html>
