# Moria
Codes used in Gilman et al. (2020) (https://www.medrxiv.org/content/10.1101/2020.07.07.20140996v2)

This repository contains codes used to simulate COVID-19 outbreaks in the Moria refugee camp as described in Gilman et al. (2020) (https://www.medrxiv.org/content/10.1101/2020.07.07.20140996v2)

Pairs of codes with the naming convention moria_caller*.m and moria_condor*.m run blocks of 100 simulations under each of 8 different sets of assumptions about transmission rates, interaction rates, and home range sizes (i.e., movement). These correspond to the rows in supplementary tables S1-S11. In general, moria_condor*.m is the main simulation, and moria_caller*.m calls that simulation 800 times with the appropriate parameter values. make_obs_180402.m creates a matrix of interaction rates between members of the population, and is called by moria_condor*.m. age_and_sex.mat contains fully anonymised data on the age distribution, sex, and health state of people in the Moria population, and is used to create a similar population for the model.

The only goal of moria_caller*.m is to assign parameter values and loop through simulations. So, if you goal is to understand the simulations themselves, I recommend going straight to moria_condor*.m. Moreover, the moria_condor*.m files differ only in their parameter values, so if you understand one, you understand them all. The code is annotated, but of you have questions, you can contact me through GitHub or at tucker.gilman@manchester.ac.uk.

Finally, note that this code runs in MATLAB 2020, but produces and error in some older versions of MATLAB. I think it would be easy to fix, if necessary. There is a matrix somewhere in the simulation with a variable number of rows, and if it drops to one row, over versions of MATLAB convert it to a column vector and some of the matrix operations fail. I have not bothered to fix this, simply because I do not need to run the code on old versions of MATLAB.
