
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓıÈÎÎñÊµÌå´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ½ÌÓıÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\teach\\teach_head.lua");

-- ½ÌÓıÈÎÎñ½±ÀøÎÄ¼ş
Include("\\script\\task\\teach\\teach_award.lua");

-- µÚÒ»´ÎÓëÒ°ÛÅ¶Ô»°
function task_000_00()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%y%m%d"))
--	if nNation ~= 89 then
--		Talk(1, "", "Giang hå ®ang dËy sãng, ta ph¶i nghØ ng¬i 1 tİ ®· !!!!!")
--		return 0
--	end
	
--	if nDate > 140406 then
--		Talk(1, "", "Giang hå ®ang dËy sãng, ta ph¶i nghØ ng¬i 1 tİ ®· !!!!!")
--		return 0
--	end
	
	local strMain = {
		"<color=green>Pioneer Counselor:<color> I'm glad that you've come to <color=yellow>Dav Tep Ti2<color>. I am the Pioneer Counselor, the <color=yellow>Beginner's Instructor<color> of this game. Do you need any <color=yellow>Game Introduction<color> or <color=yellow>Help for Quest<color>? This is the Martial Guide written by the ancient master. You may find the answers if you encounter any problem in the future.",
		"Yes./task_000_okay", 
		"No, I just come to visit/task_000_01"
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- Ñ¡ÔñÌıÒ°ÛÅ½²½â
function task_000_okay()

	local strMain = {

		"<color=green>Pioneer Counselor:<color> What do you want to know?",
		"Basic operation/Teach_Basic",
		"Character level up/Teach_Level",
		"Properties Allocation/Teach_Point",
		"How to earn money/Teach_Earn",
		"Join School/Teach_Faction",
		"Things that can be done currently/Teach_Something",
		"I understand/task_000_00"

	}

	SelectSay(strMain);

end;


-- ¿ªÊ¼×ö½ÌÑ§ÈÎÎñ
function task_000_01()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> <color=yellow>Weapon Dealer<color>, Boutique Owner, Accessory Dealer, Apothecary, Grocery Storekeeper as knowledgeable people and they will help you.",
		"<color=green>Pioneer Counselor:<color> Why don't you visit them. You might get some nice items from them. Look at the <color=yellow>minimap<color>. Don't get lost."
	}

	TE_Talk("task_000_02",strMain);

end;

-- ½ÓÁËÈÎÎñ£¬¸Ä±äÈÎÎñ±äÁ¿£º1
function task_000_02()
	SetTask(1, 1);
	TaskTip("Visit Weapon Dealer");
end;

-- ÓëÎäÆ÷µêÀÏ°åµÄ¶Ô»°
function task_001_00()

	local strMain = {
		"<color=green>Weapon Dealer:<color> Welcome, I am the Weapon Dealer who sells weapons of level 4 and below. Do you want to know anything about weapons?",
		"Yes/task_001_01",
		"Maybe next time/task_001_02"
	}
	SelectSay(strMain);

end;

-- ÌıÎäÆ÷µêÀÏ°å½²½â
function task_001_01()

	local strMain = {
		"<color=green>Weapon Dealer:<color> The common weapons are <color=yellow>armguard<color>, <color=yellow>sword<color>, <color=yellow>projectile<color> and <color=yellow>cane<color>. You can use it without guidance of a mentor. Weapons like blade, zither, brush and staff need guidance before you can learn it.",
		"<color=green>Weapon Dealer:<color> Normal weapon can be bought from weapon shop. When your level get higher, you might need to find some special made weapons.",
		"<color=green>Weapon Dealer:<color> I have been told that if you can set a black and white magical stone on normal weapons, they will possess great power.",
		"<color=green>Weapon Dealer:<color> Skilled blacksmith will also create weapons with elemental property. This will be helpful for your adventure",
		"<color=green>Weapon Dealer:<color> You should go and meet <color=yellow>Man Boutique Dealer<color> now."
	}
	TE_Talk("task_001_02",strMain);

end;

-- ÌıÍê½²½â£¬¸Ä±äÈÎÎñ±äÁ¿£º2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ TiÖm vò khİ");
	if GetSex()==1 then
		TaskTip("Visit Men Boutique Dealor");
	else
		TaskTip("Visit Ladies Boutique Dealer");
	end;
end;

-- Óë·ş×°µêÄĞÀÏ°åµÄ¶Ô»°
function task_002_00_male()

	local strMain = {
		"<color=green>Men Boutique Dealer:<color> Welcome, I am selling male equipment of level 4 and below. I am can also explain about <color=yellow>armor<color> to you. Do you want to learn about it?",
		"Yes/task_002_01",
		"Maybe next time/task_002_02"
	}
	SelectSay(strMain);
end;

-- Óë·ş×°µêÅ®ÀÏ°åµÄ¶Ô»°
function task_002_00_female()

	local strMain = {
		"<color=green>Ladies Boutique Dealer:<color> Welcome, I am selling male equipment of level 4 and below. I am can also explain about <color=yellow>armor<color> to you. Do you want to learn about it?",
		"Yes/task_002_01",
		"Maybe next time/task_002_02"
	}
	SelectSay(strMain);
end;

-- Ìı·ş×°µêÀÏ°åµÄ½²½â
function task_002_01()

	local strMaleMain = {
		"<color=green>Men Boutique Dealer:<color> Defensive equipment includes headgear, upper part and lower part. Take note that <color=yellow>Upper Part<color> decides the defense property of player.",
		"<color=green>Men Boutique Dealer:<color> We sell common armors. If you need better ones, you should seek the help of skilled blacksmith. Sometimes, an armor might be powerful but it doesn't look good. So, some player will chose to wear it underneath a <color=yellow>Outer Clothing<color>",
		"<color=green>Men Boutique Dealer:<color> We don't sell Outer clothing though. You will have to look for it at other places.",
		"<color=green>Men Boutique Dealer:<color> Here, take this as a token of our first meeting. You should go to talk with <color=yellow>Accessory Dealer<color> now."
	}

	local strFemaleMain = {
		"<color=green>Ladies Boutique Dealer:<color> Defensive equipment includes headgear, upper part and lower part. Take note that <color=yellow>Upper Part<color> decides the defense property of player.",
		"<color=green>Ladies Boutique Dealer:<color> We sell common armors. If you need better ones, you should seek the help of skilled blacksmith. Sometimes, an armor might be powerful but it doesn't look good. So, some player will chose to wear it underneath a <color=yellow>Outer Clothing<color>",
		"<color=green>Ladies Boutique Dealer:<color> We don't sell Outer clothing though. You will have to look for it at other places.",
		"<color=green>Ladies Boutique Dealer:<color> Here, take this as a token of our first meeting. You should go to talk with <color=yellow>Accessory Dealer<color> now."
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- Óë·ş×°µêÀÏ°å¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿£º3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ tiÖm trang phôc");
	TaskTip("Visit Accessory Dealer");
end;

-- ÓëÊÎÆ·µêÀÏ°åµÄ¶Ô»°
function task_003_00()

local strMain = {
	"<color=green>Accessory Dealer:<color> Welcome, I am selling accessory of level 2 and below. Do you want to know about the basic of accessory?",
	"Yes/task_003_01",
	"Maybe next time/task_003_02"
}
SelectSay(strMain);

end;

-- ÌıÊÎÆ·µêµÄÀÏ°å½²½â
function task_003_01()

	local strMain = {
		"<color=green>Accessory Dealer: <color> Accessory is a symbol of identity. <color=yellow>Male<color> can wear jade and amulet; while <color=yellow>Female<color> wears satchet and necklace. Ring is available for both gender.",
		"<color=green>Accessory Dealer: <color> Accessory are used for protection. We only sell normal accessory. You might be able to find rare one in the wild."
	}
	TE_Talk("task_003_02",strMain);
end;

-- ÌıÍêÊÎÆ·µêÀÏ°å½²½â·¢½±Àø£¬¸Ä±äÈÎÎñ±äÁ¿£º4
function task_003_02()

	local strMain = {
		"<color=green>Accessory Dealer:<color> I have a <color=yellow>Accessory<color> for you. You should go and see <color=yellow>Apothecary's Owner<color> now."
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ Kim hoµn");
	TaskTip("Visit Apothecary's Owner");
	TE_Talk("",strMain);

end;

-- ÓëÒ©µêÀÏ°åµÄ¶Ô»°
function task_004_00()

	local strMain = {
		"<color=green>Apothecary's Owner:<color> Welcome, I am selling medicine of level 2 and below. Do you want to know about the basic of <color=yellow>Medicine<color>?",
		"Yes/task_004_01",
		"Maybe next time/task_004_02"
	}
	SelectSay(strMain);

end;

-- ÌıÒ©µêÀÏ°åµÄ½²½â
function task_004_01()

	local strMain = {
		"<color=green>Apothecary's Owner:<color> You need to bring along some medicines for emergency case. However, valuable medicines can only be found from skilled medicine maker.",
		"<color=green>Apothecary Owner<color> If you don't have any medicine, you can use <color=yellow>Herbs. Although it is not that powerful but it is sufficient for beginners like you."
	}
	TE_Talk("task_004_02",strMain);

end;

-- ÌıÍêÒ©µêÀÏ°å½²½â»òÕßÖ±½ÓÌøµ½ÕâÀï£¬¸Ä±äÈÎÎñ±äÁ¿£º5
function task_004_02()

	local strMain = {
		"<color=green>Apothecary's Owner:<color> I have x20 <color=yellow>Small Healing Potion<color> for you. Put it in the shortcut bar. You can look for <color=yellow>Grocery Storekeeper<color> now"
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ D­îc ®iÕm");
	TaskTip("Visit Grocery Storekeeper");
	TE_Talk("",strMain);

end;

-- ÓëÔÓ»õµêÀÏ°åµÄ¶Ô»°
function task_005_00()

	local strMain = {
		"<color=green>Grocery Storekeeper<color> Welcome, I am the Grocery Storekeeper who sells different kinds of goods. Do you want me to explain about <color=yellow>Item<color>?",
		"Yes/task_005_01",
		"Maybe next time/task_005_02"
	}
	SelectSay(strMain);

end;

-- ÌıÔÓ»õµêÀÏ°åµÄ½²½â
function task_005_01()

	local strMain = {
		"<color=green>Grocery Storekeeper:<color> There are some items that are ingredients for creating higher level equipments. Fur and Cloth can be used to make armors while mineral can be used to make weapons.",
		"<color=green>Grocery Storekeeper:<color> Forages can be used to make food and you will need the blood to make charm. Sometimes, you might also be able to obtain some mysterious items.",
		"<color=green>Grocery Storekeeper:<color> Rumors says that there is a <color=yellow>Mysterious Merchant<color> who is gathering different kinds of mysterious items."
	}
	TE_Talk("task_005_02",strMain);

end;

-- ÌıÍêÔÓ»õµêÀÏ°åµÄ½²½âºó»òÕßÖ±½ÓÌøµ½ÕâÀï£¬¸Ä±äÈÎÎñ±äÁ¿£º6
function task_005_02()

	local strMain = {
		"<color=green>Grocery Storekeeper:<color> Here are x2<color=red>Identify Scroll<color> for you. If you obtain any unidentified <color=yellow>equipments<color>, you can use this charm to identify it.",
		"<color=green>Grocery Storekeeper:<color> Yoy can return to <color=yellow>Pioneer Counselor<color> now."
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ T¹p hãa");
	TaskTip("Return to Pioneer Counselor");
	TE_Talk("",strMain);

end;

-- »ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_006_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> How is it going?",
		"<color=green>Player:<color> I have obtained a lot of items.",
		"<color=green>Pioneer Counselor:<color> Come and find me again after you have reached <color=yellow>level 4<color>. Press <color=yellow><F3><color> to open the character status window and perform <color=yellow>Level Up<color>. If you're hurt, come and seek healing from me for free.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("§Õn gÆp D· TÈu");
	TaskTip("Return to Pioneer Counselor after you've reached level 4");
end;

-- µ½ÁË 4 ¼¶Ö®ºóÓëÒ°ÛÅµÄ¶Ô»°
function task_007_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Wow, you're fast. How's the battle.",
		"<color=green>Player:<color> So far so good. I just need to hack and slash.",
		"<color=green>Pioneer Counselor:<color> Go and talk to <color=yellow>City Gate Guard<color> and <color=yellow>Martial Art Instructor<color> to learn about the monsters."
	}
	TE_Talk("task_007_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("Visit City Gate Guard to learn about the monster");
end;

-- Óë³ÇÃÅÎÀ±øµÄ¶Ô»°
function task_008_00()

	local strMain = {
		"<color=green>Player:<color> Sir, Pioneer Counselor wants me to ask about <color=yellow>Monster Distribution<color>.",
		"<color=green>City Gate Guard:<color> Ok, let me tell you something about it.",
		"<color=green>City Gate Guard:<color> The further you go from the city, the higher the level of the monsters. The highest level of the monsters can be <color=yellow>level 50<color>.",
		"<color=green>City Gate Guard:<color> There are different kinds of dungeons and the monsters have the level higher than level 50. You shouldn't go in there when you're not strong enough.",
		"<color=green>Player:<color> How do I know the monsters is dangerous to me?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"<color=green>City Gate Guard:<color> Look at the same tag's <color=yellow>color<color> of the monsters. <color=yellow>White<color> means you can defeat them easily. <color=yellow>Red<color> means the monsters have higher level. <color=yellow>Blue<color> refers to mini boss. <color=yellow>Gold<color> are MVP and you should be careful of it.",
		"<color=green>Player:<color> I see.",
		"<color=green>City Gate Guard:<color> You're a begineer and you should just fight the monsters around the town. You can go further after you have joined a school.",
		"<color=green>Player:<color> Do you have anything else to teach me?",
		"<color=green>City Gate Guard:<color> You can find me to <color=yellow>enquire<color> about suitable places for training. You can find Martial Art Instructor to learn about battle skill.",
		"<color=green>Player:<color> Thank you. I will look for <color=yellow>Martial Art Instructor<color> now."
	}
	TE_Talk("task_008_01",strMain);

end;

-- ÓëÎÀ±ø¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("VÖ binh thµnh m«n");
	TaskTip("Look for Martial Art Instructor to learn battle skill");
end;

-- ÓëÎäÊ¦¶Ô»°
function task_009_00()

	local strMain = {
		"<color=green>Player:<color> Pioneer Counselor wants me to learn <color=yellow>Battle Skill<color> from you.",
		"<color=green>Martial Art Instructor:<color> To learn <color=yellow>Battle Skill<color>, you must know how to fight. Do you know the difference of right click attack and left click attack?",
		"<color=green>Player:<color> No",
		"<color=green>Martial Art Instructor:<color> Left click is normal button while right click is skill attack. Left click on the monster and you will attack it. After you have learned skill, you can put it at the box in the lower right and use <color=yellow>Right Click<color> to perform skill and attack the enemies. You can use this for sect skill, scroll skill or skills learned from me.",
		"<color=green>Player:<color> I see.",
		"<color=green>Martial Art Instructor:<color> You must learn about the Monster's attribute to win a battle easily.",
		"<color=green>Player:<color> The guard has already told me.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"<color=green>Martial Art Instructor:<color> You must know about the attack style and attack attribute of the monsters too. For <color=yellow>attack style<color>, there are passive attack, aggressive attack, detect attack, group attack and loot.",
		"<color=green>Player:<color> Please tell me about it.",
		"<color=green>Martial Art Instructor:<color> <color=yellow>Passive Attack<color> means the monsters will only attack you if it is attacked. <color=yellow>Aggressive Attack<color> means the monsters will attack you once it sees you. <color=yellow>Detect Attack<color> means the monsters will attack you when you're casting a skill. <color=yellow>Group Attack<color> means the monsters will attack if you attack one of its companion. <color=yellow> Loot<color> refers to monsters that take away the items that fall on the ground. Player can only get the items back by defecting this monsters.",
		"<color=green>Player:<color> What about the monster's <color=yellow>Attack Property<color>?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°µÄÀ©Õ¹
function task_009_01()

	local strMain = {
		"<color=green>Martial Art Instructor:<color> There are 7 types of element: Gold, Wood, Water, Fire, Earth, Yin and Neutral. Low level monsters are usually neutral. After level 20 and above, you will meet monsters with <color=yellow>element property<color>. Their attack will change according to the order of elements and will deal additional damage to the neutral property. You will receive more damage if you do not have elemental equipment.",
		"<color=green>Player:<color> What about the <color=yellow>Ying Property<color>?",
		"<color=green>Martial Art Instructor:<color> After <color=yellow>Kingdom Territory Map<color> shatters into pieces, a new monster is born. They are not afraid of attacks from normal attack and five elemental property. They can only be defeated with holy power. The property of this monster is known as <color=yellow>Yin Property<color>.",
		"<color=green>Player:<color> What penalties will I suffer if I am defeated in battle?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°µÄÀ©Õ¹
function task_009_02()

	local strMain = {
		"<color=green>Martial Art Instructor:<color> When you've defeated, you will lose 1% of current experience and 5% of money and reputation. You will also suffer <color=yellow>external injury<color> or <color=yellow>internal injury<color>. When you're defeated, you can choose to return to city or wait for a Emei disciples to resurrect you. If you're resurrect, you will lose money and reputation but you will not lose any experience or sufer any injuries.",
		"<color=green>Player:<color> Can you teach me some skill?",
		"<color=green>Martial Art Instructor:<color> I can teach you <color=yellow>Fleet Movement<color> but you will have to come again another time.",
		"<color=green>Player:<color> Thank you, I will return to <color=yellow>Pioneer Counselor<color> now."
	}
	TE_Talk("task_009_03",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Vâ s­");
	LearnSkill(20)--Ö±½ÓÑ§»áÇá¹¦
	TaskTip("Return to Pioneer Counselor")
end;

-- »ØÈ¥ÓëÒ°ÛÅ¶Ô»°
function task_010_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Do you know how to fight now?",
		"<color=green>Player:<color> I have learned a lot from them.",
		"<color=green>Pioneer Counselor:<color> Ok then, come back to me after you reached level 6. You should find <color=yellow>Item Keeper<color> to store your things."
	}
	TE_Talk("task_010_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("Come to Pioneer Counselor after you've reached level 6");
end;

-- µÈ¼¶µ½ÁË 6 ¼¶Ê±»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_011_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> How are you feeling?",
		"<color=green>Player:<color> I just hope that I can <color=yellow>interact<color> with other players.",
		"<color=green>Pioneer Counselor:<color> Oh, I see.",
		"<color=green>Pioneer Counselor:<color> Look for <color=yellow>Grand Inn Owner<color> and <color=yellow>Escort Guard<color> to learn more knowledge.",
		"<color=green>Player:<color> Really? I will look for <color=yellow>Grand Inn Owner<color>"
	}
	TE_Talk("task_011_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ töu lÇu");
	TaskTip("Look for Grand Inn Owner to learn interactive skill");
end;

-- Óë¾ÆÂ¥ÀÏ°åµÄ¶Ô»°
function task_012_00()
	local strMain = {
		"<color=green>Player:<color> Can you teach me how can I <color=yellow>interact<color> with other people?",
		"<color=green>Grand Inn Owner:<color> Press <color=yellow><Ctrl><color> button and right click on the person you wish to interact with. Then choose the option that you want from the pop up menu.",
		"<color=green>Grand Inn Owner:<color> <color=yellow>Inspect:<color> let you see the information of the target; <color=yellow>Chat:<color> let you chat with the player. <color=yellow>Follow:<color> let you trail the target; <color=yellow>Trade:<color> allow you to trade with player; <color=yellow>Party:<color> to invite player to join or form a party.",
		"<color=green>Player:<color> What if the target is not in my view?",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		"<color=green>Grand Inn Owner:<color> Press <color=yellow><Enter><color> or click on <color=yellow>channel<color> selection button to change the chat mode. Then, key in the name of the target and key in your message as well. After that, click <Enter> to send the message.",
		"<color=green>Player:<color> What's a chat channel?",
		"<color=green>Grand Inn Owner:<color> You can choose a lot of chat channel in this game. <color=yellow>Screen Channel<color> let everyone in the screen sees your message. <color=yellow>World channel<color> allows everyone in the server to see your message. System Channel only shows system information.",
		"<color=green>Grand Inn Owner:<color> <color=yellow>Party Channel<color> allows player in your party to see your message. <color=yellow>School Channel<color> allows player in your school to see your message. <color=yellow>Guild Channel<color> allows player in your guild to see your message.",
		"<color=green>Player:<color> Why can't I talk after I select a channel?",
	}
	TE_Talk("task_012_01",strMain);
end;

-- Óë¾ÆÂ¥ÀÏ°åµÄ¶Ô»°À©Õ¹
function task_012_01()

	local strMain = {
		"<color=green>Grand Inn Owner:<color> In order to preserve a good gaming environment and prevent players from flooding the screen, every channel has a different limitation of speech. School Channel requires player to join a school before he can talk. Player can only make one speech every 1 minute. World Channel is only usable for players with level 30 and above and player can give out a speech for every 3 minutes. The chat channel that has a limitation are red in color.",
		"<color=green>Player:<color> I see.",
		"<color=green>Grand Inn Owner:<color> You can ask the Escort Guard about how to interact with other players.",
		"<color=green>Player:<color> I will look for the <color=yellow>Escort Guard<color>."
	}
	TE_Talk("task_012_02",strMain);
end;

-- Óë¾ÆÂ¥ÀÏ°å¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("Look for Escort Guard");
end;

-- ÓëïÚÊ¦µÄ¶Ô»°
function task_013_00()

	local strMain = {
		"<color=green>Player:<color>Grand Inn Owner says you know how to <color=yellow>Make Friends<color>. Can you teach me?",
		"<color=green>Escort Guard:<color> Click <color=yellow><Ctrl><color> button and right click on the Target, then choose <color=yellow>Friend<color> from the pop up menu. The system will send invitation to ask him to be your friend. His name will be added into your friend list if he agrees. When you press <color=yellow><F6><color> to open the friend interface, you will be able to find this friend.",
		"<color=green>Player:<color> What's the Intimacy level?",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		"<color=green>Escort Guard:<color> Player who becomes friends will have a <color=yellow>Intimacy<color> value. If players always form party or chat together, the relationship value will increase. Certain unique items such as Rose will increase the value too. When the value is higher than 1000, you will be able to <color=yellow>bond as siblings<color>. When the value excees 1500, players with different gender will be able to seek the assistance of Moon Elder and become <color=yellow>Husband and Wife<color>",
		"<color=green>Escort Guard<color> Friends, Siblings or husband and wife will be able to gain experience bonus when they form a party and train together.",
		"<color=green>Player:<color> I see. I should get a few friend then.",
		"<color=green>Escort Guard:<color> You can also learn emoticons from <color=yellow>Madame Dance<color>. Anyways, you should return to Pioneer Counselor now.",
		"<color=green>Player:<color> Ok, I will return to <color=yellow>Pioneer Counselor<color> now."
	}
	TE_Talk("task_013_01",strMain);
end;

-- ÓëïÚÊ¦¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Tiªu s­");
	TaskTip("Return to Pioneer Counselor");
end;

-- »ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_014_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Have you learned how to interact?",
		"<color=green>Player:<color> Yes.",
		"<color=green>Pioneer Counselor:<color> Good. Now you may go and form a party with your friend before coming back to me. I will prepare a <color=yellow>gift<color> for you. If you cannot found any suitable friend, you may just form your own single party. However, the <color=yellow>gift<color> for you will be different from the first gift."
	}
	TE_Talk("task_014_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao ®æi nhiÖm vô víi ng­êi kh¸c");
	TaskTip("Look for a friend or form a single party and return to Pioneer Counselor");
end;



-- Íæ¼ÒÔÙ´Î´øÅóÓÑÀ´ÓëÒ°ÛÅ¶Ô»°
-- ´«Èë²ÎÊı£º1 ÎªÒÑ¾­×é¶Ó  2 Îª»¹Ã»ÓĞ×é¶Ó  3 ÎªÑ¡²»ÖªµÀÔõÃ´×é¶Ô  4 ÎªÑ¡»¹Ã»ÓĞ×é¶Ó
function task_015_check(nState)
	local strMain = {
		"Cã mãn quµ nhá tÆng c¸c ng­¬i, hy väng hai ng­êi sÏ lµ h¶o h÷u tèt cña nhau.",
		"<color=green>Pioneer Counselor:<color> Are you trying to trick me? You should <color=yellow>form a party<color> before you come.",
		"<color=green>Pioneer Counselor:<color> Click on the <color=yellow>Party<color> button on the interface to open the party window and invite your friend to join you to form a party. Then, come and talk to me.",
		"NhiÒu ng­êi ®Õn t×m ta råi, ng­¬i cßn kh«ng nhanh ch©n!",
		"<color=green>Pioneer Counselor:<color> It is better to have more buddies than enemies. Hopefully you will get some good friends here.",
		"NÕu kh«ng t×m ®­îc h¶o h÷u th× cø tæ ®éi víi ai ®ã råi ®Õn gÆp ta!"
	
	
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- ´øÁìÁËÅóÓÑÀ´Ö®ºó¸Ä±äÈÎÎñ±äÁ¿£º16
function task_015_01()

local strMain = {
	"<color=green>Pioneer Counselor:<color> Come to me after you have reached level 8."
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("NhiÖm vô kÕt giao h¶o h÷u");
	TaskTip("Talk to Pioneer Counselor after you have reached level 8");
	TE_Talk("",strMain);
end;

-- µ½ÁË 8 ¼¶Ö®ºóºÍÒ°ÛÅµÄ¶Ô»°
function task_016_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> You're level 8 now and you can join a School to learn skills now.",
		"<color=green>Player:<color> Thank you for teaching me.",
		"<color=green>Pioneer Counselor:<color> I'm a Beginner's Instructor and you should visit all schools to learn about their <color=yellow>characteristics<color>.",
		"<color=green>Player:<color> How do I get there?",
		"<color=green>Pioneer Counselor:<color> Look for <color=yellow>School Transporter<color> to go to difference sects. <color=yellow>Mr Know-It-All<color> has asked me <color=yellow>six questions<color> that I don't know the answers. Can you help me?"
	}

	TE_Talk("task_016_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("Visit all School and answer Pioneer Counselor questions")
end;

-- ÔÙ´Î»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_017_00()
	Say("<color=green>Pioneer Counselor:<color> Do you truly understand the unique of all the sects?",2,"Yes, I understand/Teach_Qustion_001","Maybe I still need more time to explore/task_exit");
	return
end;

-- ÍêÈ«ÕıÈ·µÄ»Ø´ğÎÊÌâºó
function task_017_01()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> I understand now. Please inform <color=yellow>Mr.Know-It-All<color> and let's wait for his response."
	}
	TE_Talk("task_017_02",strMain);
end;

-- ¸Ä±äÈÎÎñ±äÁ¿£º18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("HiÓu vÒ c¸c m«n ph¸i");
	TaskTip("Tell the answer to Mr.Know-It-All");
end;

-- Óë°ÙÏşÉúµÄ¶Ô»°
function task_018_00()

	local strMain = {
		"<color=green>Player:<color> This is the answer. What do you think?",
		"<color=green>Mr Know-It-All:<color> Do you know about the <color=yellow>branch<color> of Warrior, Hero, Hermit?",
		"<color=green>Player:<color> Can you tell me?",
		"<color=green>Mr Know-It-All:<color> There are 10 Sects: Shaolin, WuDang, Emei, Beggers, Tang Clan, Ming Cult, Kun Lun, Five Poisions Sect, Emerald Mist & Yang Family. Currently, only 7 sects are recruiting disciples. They are Shaolin, WuDang, Emei, Beggar Sect, Tang Clan, Yang Family and Five Poisions.",
		"<color=green>Mr Know-It-All:<color> Shaolin is divided into Zen, Martial and Commoner. Wudang has Sword and Brush branch; Emei has Zither and Sword branch; Begger Sect has Cane and Fist branch; Tang Clan has Chivalrous and Technical branch; Yang Family has Spear Rider and Bow Rider; and Five Poisions Sect has Parasiter and Wickman. You can only choose one branch for your future progress.",
		"<color=green>Player:<color> How am I going to choose from the 14 branches?",
		"<color=green>Mr Know-It-All:<color> These branches can be categorized into Warrior, Hero and Hermit. You won't feel confused if you know this.",
		"<color=green>Player:<color> Please elaborate this!",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		"<color=green>Mr Know-It-All:<color> Warrior, Hero, and Hermit refer to the types of training for players. <color=yellow>Warrior<color> possesses great strength and body.",
		"<color=green>Mr Know-It-All:<color> <color=yellow>Hero<color> emphasizes on balance and agility. <color=yellow>Hermit<color> trains in energy.",
		"<color=green>Player:<color> Which branch should I choose then?",
		"<color=green>Mr Know-It-All:<color> You're still new and this will only come to you after you have joined a sect. You will need to choose carefully to prevent feeling regret in future.",
		"<color=green>Player:<color> Why don't you give me some advices to prevent that?",	
	}
	TE_Talk("task_018_01",strMain);
end;

-- Óë°ÙÏşÉúµÄ¶Ô»°À©Õ¹
function task_018_01()

	local strMain = {
		"<color=green>Mr Know-It-All:<color> Every branch has their specialty and there is not solid good or best among them. So, you have to think carefully before you choose it.",
		"<color=green>Player:<color> I really don't know what to choose.",
		"<color=green>Mr Know-It-All:<color> As long as you like it.",
		"<color=green>Player:<color> I see. Thank you!",
		"<color=green>Mr Know-It-All:<color> <color=yellow>Pioneer Counselor<color> is waiting for you, you should go now."
	}
	TE_Talk("task_018_02",strMain);
end;

-- Óë°ÙÏşÉú¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("Return to Pioneer Counselor");
end;

-- ÔÙ´Î»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_019_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> What did Mr Know-It-All said?",
		"<color=green>Player:<color> He explained about the three branches to me.",
		"<color=green>Pioneer Counselor:<color> Warrior, Hero, Hermit? He really knows a lot. Come and find me again when you have reached <color=yellow>level 9<color>. You can also accept quest from <color=yellow>Merchant Guild Boss<color> to earn some money."
	}
	TE_Talk("task_019_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("Return to Pioneer Counselor after you have reached level 9");
end;

-- Íæ¼Òµ½ÁË 9 ¼¶Ö®ºóºÍÒ°ÛÅ¶Ô»°
function task_020_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Thirty years... Oh, you're back... You're exhausting to travel out there right? Rest a while to recover yourself.",
		"<color=green>Player:<color> What happen thirty years ago?",
		"<color=green>Pioneer Counselor:<color> It's nothing. I have a letter here. Please deliver it to <color=yellow>Zhao Yan Nian at BianJing<color>. I'll tell you about it later.",
	}

	TE_Talk("task_020_01",strMain);

end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("Pioneer Counselor wants you to delivery a letter to Zhao Yan Nian at BianJing");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"<color=green>Zhao Yan Nian<color>: Hello "..GetPlayerSex()..", Are you looking for me?",
		"<color=green>Player:<color> Pioneer Counselor has a letter for you.",
		"<color=green>Zhao Yan Nian:<color> Oh I see!",
		"(Zhao Yan Nian reads the letter)",
		"<color=green>Zhao Yan Nian:<color> Can you make me a <color=yellow>Bun<color>?",
		"<color=green>Player:<color> I don't know how...",
		"<color=green>Zhao Yan Nian:<color> You are suppose to know this.",
		"<color=green>Zhao Yan Nian:<color> Open the <color=yellow>skill interface<color> and choose <color=yellow>Survival Skill<color>. Then, choose <color=yellow>Bun<color> and click <color=yellow>Produce<color>. You can also use this to make bandage. However, you won't be able to use family skill if you do not have enough stamina.",
		"<color=green>Player:<color> I see. Let me try it!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("Zhao Yan Nian wants you to make him a bun.");
end;



function task_022_00()

	local strMain = {
		"<color=green>Zhao Yan Nian<color> Pioneer Counselor wants me to tell you what happen 30 years ago.",
		"<color=green>Player:<color> I'm listening...",
		"<color=green>Zhao Yan Nian<color> 30 years ago, after Zhao Kuang Yin obtained the <color=yellow>Kingdom Territory Map<color>, he promised all schools that he will share the treasure of this map with them if they help him to start a revolution. However, this map is actually a <color=green>Realms Guardian Scroll<color> that protect the country. Zhao's act had angered the heaven and the map was shattered on the day his coronation.",
		"<color=green>Zhao Yan Nian:<color> Since then, the country is in chaos. Since Zhao cannot keep his promise, he took away the power of all schools and try to find someone to gather the fragments of the Kingdom Territory Map. All the schools are suspicious but they couldn't do anything."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("Ch­a lµm xong b¸nh ng« µ? H·y më kü n¨ng sèng ra xem ®i!",0);
	end;
	
end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º23
function task_022_01()

	local strMsg = {
		"<color=green>Zhao Yan Nian:<color> This is slowly forgotten but Zhao is suddenly dead and bad rumors start to go around... Besides that, Liao soldiers are gathering in front of <color=yellow>Yan's gate<color>. <color=yellow>Liang Shan Po<color> is also conqured by the bandits and monsters are creating chaos in <color=yellow>ChengDu and QuanZhou city<color>.",
		"<color=green>Player:<color> No, I must save the country.",
		"<color=green>Zhao Yan Nian:<color> You should train until level 10 before you start with all these or it will be a big burden to you."
	};
	local strMain = {
		"Ta kh«ng thÓ khoanh tay ®øng nh×n, ph¶i t×m c¸ch cøu Trung Nguyªn th«i!",
		"Sè phËn do trêi, ng­¬i ®õng qu¸ lo l¾ng! §¹t cÊp 10 quay l¹i t×m ta.",
		"NhÊt ®Şnh v·n bèi sÏ quay l¹i!"
	};

	TE_SetTeachAdd();
	TaskTip("Zhao Yan Nian wants you to meet him again after you reached level 10");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"<color=green>Zhao Yan Nian:<color> You haven't let me down. So, I will give this task to you.",
		"<color=green>Zhao Yan Nian:<color> Bring these letters to <color=yellow>Pioneer Counselor<color> and he will tell you what to do.",
		"<color=green>Player:<color> I won't let you down."
	}
	TE_Talk("task_023_01",strMain);
end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º24
-- ¸øÓèÍæ¼ÒÈı·âĞÅ
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("Zhao Yan Nian wants you to bring 3 letters to Pioneer Counselor");
end;


function task_024_00()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Do you know the true identity of Zhao Yan Nian?",
		"<color=green>Player:<color> No, I don't.",
		"<color=green>Pioneer Counselor:<color> Zhao Yan Nian is a member of the Royal family who left the palace.",
		"<color=green>Player:<color> I see.",
		"<color=green>Pioneer Counselor:<color> You can visit the Schools now. Train harder and you can succeed in future.",
		"<color=green>Player:<color> Yes, Sir!"
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Zhao Yan Nian wants me to deliver 3 letters. Can you help me to do it?",
		"<color=green>Player:<color> Who should I send to?",
		"<color=green>Pioneer Counselor:<color> Zhao Yan Nian is worried about the <color=yellow>strange incidents<color> and we decide to contact some old friends: <color=yellow>Kou Zhun<color> can be found at BianJing. <color=yellow>Fan Zhong Yan<color> at South of ChengDu, <color=yellow>Wang Ye Wei<color> at QuanZhou.",
		"<color=green>Pioneer Counselor:<color> They will tell you what to do then. Please take this and it might be useful in your journey.",
		"<color=green>Player:<color> I am taking off now."
	}
	TE_Talk("task_024_02",strMain);
end


-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("ChuyÖn giang hå");
	TaskTip("You can go on your adventure now.");
	SetTask(130,1); --ÍõÒµÎ°
	SetTask(131,1); --¿Ü×¼
	SetTask(132,1); --·¶ÖÙÑÍ
end;


-- ·ÅÆú×ö½ÌÓıÈÎÎñ
function task_giveout()
--	TE_SetTeachState(23);
	Say("ThÊy ng­¬i b¶n lÜnh h¬n ng­êi, l·o ®©y kh«ng cÇn d¹y nhiÒu, vÒ sau ®iÒu g× kh«ng hiÓu cã thÓ ®Õn t×m ta.", 0);
end;

-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function task_exit()

end;






-- »ù±¾²Ù×÷
function Teach_Basic()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> When you click on an empty space, the character will move to that location. You can check the <color=yellow>minimap<color> if you lost your way. The <color=yellow>Yellow Spot<color> show your current location.",
		"<color=green>Pioneer Counselor:<color> Simply click on the monster to start attack once you encountered them at city outskirt.",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ÈËÎïµÈ¼¶ÌáÉı
function Teach_Level()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> Level up of character requires <color=yellow>EXP<color>. You can press <color=yellow><F3><color> to open the character equipment window. Click <color=yellow>Arrow<color> to perform <color=yellow>character level up<color>. You will obtain <color=yellow>Attribute Point<color> once your character level up.",
		"<color=green>Pioneer Counselor:<color> <color=yellow>Experience<color> can be obtained through battle and quest solving. Experience is used to level up both th character and the skill level."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜÇ±ÄÜµã·ÖÅä
function Teach_Point()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> There are 5 types of attribute: <color=yellow>Strength<color>, <color=yellow>Inner Force<color>, <color=yellow>Vitality<color>, <color=yellow>Agility<color> and <color=yellow>Observation<color>.",
		"<color=green>Pioneer Counselor:<color> <color=yellow>Strength<color> decides attack and weight capacity. <color=yellow>Inner Force<color> decides player's MP, Skill Attack and Skill defense.",
		"<color=green>Pioneer Counselor:<color> <color=yellow>VIT<color> decides player's HP and physical defense. <color=yellow>AGI<color> decides player's dodge, accuracy and attack speed. <color=yellow>OBS<color> decides player's dodge and critical hit, flee and attack speed.",
		"<color=green>Pioneer Counselor:<color> For a begineer, Attribute Point should be invested in <color=yellow>Strength<color> and <color=yellow>Vitality<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜ×¬Ç®
function Teach_Earn()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> You can gain money by defeating monsters or solving some simple quests to get your rewards. The imperial court will also send some Royal Emissary to help the beginners. You should make use of this opportunity.",
		"<color=green>Pioneer Counselor:<color> When you reach <color=yellow>level 10<color>, you can start to do vending, treasure hunting, attend battle arena and do other different kind of things to earn money."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜ°İÈëÃÅÅÉ
function Teach_Faction()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> When you reach level 10, you can also visit the <color=yellow>School Transporter<color> to visit a school.",
		"<color=green>Pioneer Counselor:<color> Each school has a different branch. Remember to find out the characteristic of each branch before you choose to join anyone of them."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜµ±Ç°ÄÜ×öµÄÊÂÇé
function Teach_Something()

	local strMain = {
		"<color=green>Pioneer Counselor:<color> You should take a walk in the city to get familiar with it. <color=yellow>Talking<color> with the people in the city might get you some help and instructions.",
		"<color=green>Pioneer Counselor:<color> You can also try to defeat the monsters but you should stay away from the furious one. If you're hurt, look for me to heal you for free. You should also make more friends to help you in future.",
		"<color=green>Pioneer Counselor<color> If you choose to do beginners quest, you will get a new quest every time you level up. This will continue until you reached level 10. You can press <color=yellow><F11><color> to open the quest window and check it out."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- Áù¸öÎÊ´ğÌâµÄÄÚÈİ
function Teach_Qustion_001()
	Say("<color=green>Pioneer Counselor:<color> I will start now: Question 1: How many sects are currently recruiting apprentice?",4,"10 sects/Teach_Qustion_Error","8 sects/Teach_Qustion_Error","7 sects/Teach_Qustion_002","3 sects/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("<color=green>Pioneer Counselor:<color> Well done! Following is the 2nd question: Wudang is the famous in Sword mastery. Which branch allows Wudang disciples to learn sword skills?",3,"Sword Branch/Teach_Qustion_003","Brush Branch/Teach_Qustion_Error","Both Branch/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("<color=green>Pioneer Counselor:<color> Well done! Following is the 3rd question: Tang is a blood-tied clan, and how do we call the person in charge of Tang with respect?",4,"Leader of the Order/Teach_Qustion_Error","Chief/Teach_Qustion_004","Leader/Teach_Qustion_Error","Chief Manager/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("<color=green>Pioneer Counselor:<color> Well done! Following is the 4th question: Which is the weapon that used by Emei's Zither Branch?",4,"Needle/Teach_Qustion_Error","Sword/Teach_Qustion_Error","Zither/Teach_Qustion_005","Brush/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("<color=green>Pioneer Counselor:<color> Well done! Following is the 5th question: Shaolin is famous with 72 type of skills. How many branches are available in Shaolin?",4,"1 branch/Teach_Qustion_Error","2branches/Teach_Qustion_Error","3 branches/Teach_Qustion_006","4 branches/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("<color=green>Pioneer Counselor:<color> Well done! Following is the 6th question: There are 2 branches available in Beggar sect, and what kind of skill is learned by Fist branch?",4,"Staff/Teach_Qustion_Error","Fist/task_017_01","Taming/Teach_Qustion_Error","Ambush/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("<color=green>Pioneer Counselor:<color> But it is different from what I had heard, do you want to check it clearer?",1,"I'll check out more details/task_exit");
end
