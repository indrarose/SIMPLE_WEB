package net.rose.simple.service;

import net.rose.simple.db.pojo.People;
import net.rose.simple.db.repo.PeopleRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.lang.invoke.MethodHandles;
import java.util.Optional;

@Service
public class PeopleService {

    static Logger logger = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    @Autowired
    private PeopleRepository peopleRepository;

    @PostConstruct
    private void init(){
        logger.info("Service {} started", getClass().getSimpleName());
    }

    public void save(People people){
        logger.info("Updating people {}", people);
        peopleRepository.save(people);
    }

    public Page<People> find(Pageable pageable){
        return peopleRepository.findAll(pageable);
    }

    public Optional<People> getPeople(Long id){
        return peopleRepository.findById(id);
    }

    public void delete(Long id){
        peopleRepository.deleteById(id);
    }

}
