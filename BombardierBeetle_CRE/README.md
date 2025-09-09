# CRE in Bombardier Beetle

## Overview
This repository contains the course project **CRE in Bombardier Beetle** guided by *Prof. Sonali Das* (Mar’24 – May’24).  
It models the beetle’s chemical defense mechanism using **MATLAB** and **reaction engineering principles**.

## Features
- Models the beetle's **exothermic decomposition reaction** inside its chamber.
- Uses **MATLAB ODE solvers** to simulate substrate consumption and temperature rise.
- Provides **plots and analysis** replicating and extending the findings of James et al. (1960).

## Project Structure
```
BombardierBeetle_CRE/
│── src/
│   └── beetle_model.m
│── report/
│   └── project_report.md
│── requirements.txt
│── README.md
```

## Usage
1. Open MATLAB (R2023a or later).
2. Run the model:
   ```matlab
   cd src
   beetle_model
   ```
3. View output plots in `reaction_plots.png`.

## Example Outputs
- Concentration vs Time of H2O2 & Hydroquinone
- Temperature rise inside the beetle’s reaction chamber
