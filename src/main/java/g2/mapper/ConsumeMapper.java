package g2.mapper;

import g2.model.Consume;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ConsumeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    @Delete({
        "delete from consumelog",
        "where id = #{id,jdbcType=NUMERIC}"
    })
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    @Insert({
        "insert into consumelog (id, Car_id, ",
        "Use_id, amount, time, ",
        "result, reason)",
        "values (#{id,jdbcType=NUMERIC}, #{car_id,jdbcType=NUMERIC}, ",
        "#{use_id,jdbcType=NUMERIC}, #{amount,jdbcType=DOUBLE}, #{time,jdbcType=TIMESTAMP}, ",
        "#{result,jdbcType=INTEGER}, #{reason,jdbcType=VARCHAR})"
    })
    int insert(Consume record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    int insertSelective(Consume record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "id, Car_id, Use_id, amount, time, result, reason",
        "from consumelog",
        "where id = #{id,jdbcType=NUMERIC}"
    })
    @ResultMap("g2.mapper.ConsumeMapper.BaseResultMap")
    Consume selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Consume record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table consumelog
     *
     * @mbg.generated
     */
    @Update({
        "update consumelog",
        "set Car_id = #{car_id,jdbcType=NUMERIC},",
          "Use_id = #{use_id,jdbcType=NUMERIC},",
          "amount = #{amount,jdbcType=DOUBLE},",
          "time = #{time,jdbcType=TIMESTAMP},",
          "result = #{result,jdbcType=INTEGER},",
          "reason = #{reason,jdbcType=VARCHAR}",
        "where id = #{id,jdbcType=NUMERIC}"
    })
    int updateByPrimaryKey(Consume record);
}