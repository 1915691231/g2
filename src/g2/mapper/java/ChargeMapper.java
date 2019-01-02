package g2.mapper.java;

import g2.model.Charge;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ChargeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    @Delete({
        "delete from charge_log",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    @Insert({
        "insert into charge_log (id, amount, ",
        "time, uid, cid, ",
        "mid, result, reason)",
        "values (#{id,jdbcType=VARCHAR}, #{amount,jdbcType=NUMERIC}, ",
        "#{time,jdbcType=TIMESTAMP}, #{uid,jdbcType=VARCHAR}, #{cid,jdbcType=VARCHAR}, ",
        "#{mid,jdbcType=VARCHAR}, #{result,jdbcType=BIT}, #{reason,jdbcType=VARCHAR})"
    })
    int insert(Charge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    int insertSelective(Charge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "id, amount, time, uid, cid, mid, result, reason",
        "from charge_log",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    @ResultMap("g2.mapper.java.ChargeMapper.BaseResultMap")
    Charge selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Charge record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table charge_log
     *
     * @mbg.generated
     */
    @Update({
        "update charge_log",
        "set amount = #{amount,jdbcType=NUMERIC},",
          "time = #{time,jdbcType=TIMESTAMP},",
          "uid = #{uid,jdbcType=VARCHAR},",
          "cid = #{cid,jdbcType=VARCHAR},",
          "mid = #{mid,jdbcType=VARCHAR},",
          "result = #{result,jdbcType=BIT},",
          "reason = #{reason,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(Charge record);
}