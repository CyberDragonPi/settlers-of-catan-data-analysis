# Settlers of Catan – Exploratory Data Analysis

This project is an exploratory analysis of Settlers of Catan gameplay data. The goal is to investigate whether different gameplay factors influence winning probability, including dice outcomes, starting positions, resource distribution, trading behavior, and turn order.

This work was developed in collaboration with [@mkukolj](https://github.com/mkukolj) as part of an academic data analysis project.

---

## Key Questions
- Is the dice in Settlers of Catan statistically fair?
- Do starting resources influence winning probability?
- Do starting board numbers affect game outcomes?
- Does trading behavior correlate with winning?
- Does turn order impact the likelihood of winning?

---

## Dataset
The dataset contains statistics from multiple recorded Catan games, including:
- Dice roll frequencies
- Player actions (trading, resource gain/loss)
- Starting board configurations
- Final game outcomes

---

## Project Structure

- `R/` – R scripts for data analysis and modelling  
- `data/` – raw dataset and descriptions  
- `figures/` – generated plots and visualizations  
- `Rmd/` – full analysis report (R Markdown, HTML, PDF)  

---

## Methods
- Exploratory data analysis (EDA)
- Data visualization using `ggplot2`
- Statistical summaries and distributions
- Correlation and pattern analysis
- Simple predictive modeling (linear regression)

---

## Report
The full written analysis is available in:

`Rmd/Projekt.pdf`

---

## Key Insights
- Dice distribution is consistent with expected probabilities over large samples  
- Starting resources show weak correlation with winning outcomes  
- Starting numbers on board positions show stronger influence on success  
- Trading activity is higher among winning players  
- Turn order shows noticeable imbalance in win distribution  

---

## Technologies
- R  
- ggplot2  
- dplyr  
- R Markdown  

---

## Notes
This analysis is based on a limited dataset and should be interpreted as exploratory rather than definitive statistical proof. More granular, turn-by-turn data would be required for stronger conclusions.
