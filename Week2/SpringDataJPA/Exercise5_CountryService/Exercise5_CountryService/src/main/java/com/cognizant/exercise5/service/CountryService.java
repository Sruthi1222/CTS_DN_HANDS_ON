package com.cognizant.exercise5.service;

import com.cognizant.exercise5.entity.Country;
import com.cognizant.exercise5.repository.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;
import com.cognizant.exercise5.exception.CountryNotFoundException;

import java.util.List;

@Service
public class CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Transactional(readOnly = true)
    public List<Country> getAllCountries() {
        return countryRepository.findAll();
    }
    @Transactional(readOnly = true)
    public Country findCountryByCode(String countryCode) throws CountryNotFoundException {

        Optional<Country> result = countryRepository.findById(countryCode);

        if (result.isEmpty()) {
            throw new CountryNotFoundException("Country not found");
        }

        return result.get();
    }
    @Transactional
    public Country addCountry(Country country) {
        return countryRepository.save(country);
    }
    @Transactional
    public Country updateCountry(Country country) throws CountryNotFoundException {

        if (!countryRepository.existsById(country.getCode())) {
            throw new CountryNotFoundException("Country not found");
        }

        return countryRepository.save(country);
    }
}