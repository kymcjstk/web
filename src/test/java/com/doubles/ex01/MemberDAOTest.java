package com.doubles.ex01;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.b2b.web.dao.MemberDAO;
import com.b2b.web.model.MemberVO;

import javax.inject.Inject;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {

    @Inject
    private MemberDAO memberDAO;

    // �쁽�옱�떆媛� 異쒕젰 �뀒�뒪�듃
    @Test
    public void testTime() throws Exception {
        System.out.println(memberDAO.getTime());
    }

    // �쉶�썝�엯�젰 �뀒�뒪�듃
    @Test
    public void testInsertMember() throws Exception {
        MemberVO memberVO = new MemberVO();
        memberVO.setUserid("user01");
        memberVO.setUserpw("user00");
        memberVO.setUsername("user00");
        memberVO.setEmail("user00@mail.com");

        memberDAO.insertMember(memberVO);
    }

    // �쉶�썝議고쉶 �뀒�뒪�듃 1 : �븘�씠�뵒
    @Test
    public void testReadMember() throws Exception {
        memberDAO.readMember("user00");
    }

    // �쉶�썝議고쉶 �뀒�뒪�듃 2 : �븘�씠�뵒 + 鍮꾨�踰덊샇
    @Test
    public void testReadWithPW() throws Exception {
        memberDAO.readWithPW("user00", "user00");
    }
}
