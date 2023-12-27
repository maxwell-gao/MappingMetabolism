# Overview

This Wolfram Language script is designed to process and visualize biochemical data from various XML files. The data primarily relates to metabolic pathways and reactions.

## Prerequisites

Wolfram Language (Mathematica) environment is required to run this script.

## Setup

Ensure all required `kgml` files (ko01100.xml, hsa00230.xml, etc.) from KEGG.jp are located in the data/ directory relative to the script.
The script expects certain CSV files (mapData.csv, final_data.csv) in the same directory.

## Code Components

### Data Loading

The script begins by importing `kgml` files into their respective variables:

- ko01100
- hsa00230
- hsa00240
... (and so on)
These datasets are then combined into a single list and processed further.

### Data Extraction

Multiple tables and relationships are derived from the imported XML data:

`Nodes`: Extracted from entries in the XML files.
`Relations`: Captured from XML tags representing reactions, substrates, and products.
Different types of reactions (e.g., irreversible, dual substrate, dual product) are identified and organized into structured data.

### Data Mapping

Mappings between various identifiers (IDs) and names are created to facilitate data interpretation:

`ruleID2KID`: Maps rule IDs to names.
`Relation2Gene`: Maps reactions to associated genes.
... (and others)

### Visualization

A graph is constructed using the Graph function from the Wolfram Language. Nodes represent biochemical entities, and edges represent reactions.

### Data Analysis

The script performs some basic data analysis, such as computing the mean of certain values and filtering out specific types of data.

### Export

The final graph is exported as an SVG file named output.svg in the script's directory.

## Execution

Open the script in a Wolfram Language environment.
Run the script to generate the output.svg file.

## Output

The primary output is an SVG file (output.svg) containing a visual representation of the metabolic pathways based on the processed data.

## Notes

The script is specific to the data structure of the `kgml` files. Changes in the XML structure might require modifications to the script.
Ensure all required files are present in the specified directories for the script to run successfully.
