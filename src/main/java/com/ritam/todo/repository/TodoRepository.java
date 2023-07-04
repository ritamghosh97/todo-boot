package com.ritam.todo.repository;

import com.ritam.todo.entity.Todo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;

@Repository
public interface TodoRepository extends JpaRepository<Todo, Integer> {

    @Query("SELECT t FROM Todo t where t.user.id = :userId")
    List<Todo> findTodosByUserId(@Param("userId") Long id);


    @Transactional
    @Modifying
    @Query("UPDATE Todo t SET t.description=:desc, t.targetDate=:tarDate, t.isDone=:isDone WHERE t.id=:id")
    void updateTodo(@Param("id") Integer id, @Param("desc") String description,
                    @Param("tarDate") LocalDate targetDate,
                    @Param("isDone") boolean isDone);
}
