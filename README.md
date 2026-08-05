<h1 align="center">
    <a href="https://github.com/spacelab-ufsc/catarina-a1-doc"><img src="https://github.com/spacelab-ufsc/catarina-a1-doc/blob/main/figures/catarina-mission-patch.png" alt="Catarina-A1" width="50%"></a>
    <br>
    CATARINA-A1
    <br>
</h1>

<h4 align="center">Critical Design Review documentation for SpaceLab's Catarina-A1 2U CubeSat.</h4>

<p align="center">
    <a href="https://github.com/spacelab-ufsc/catarina-a1-doc">
        <img src="https://img.shields.io/badge/status-development-green?style=for-the-badge" alt="Development status">
    </a>
    <a href="https://github.com/spacelab-ufsc/catarina-a1-doc/releases">
        <img alt="GitHub commits since latest release" src="https://img.shields.io/github/commits-since/spacelab-ufsc/catarina-a1-doc/latest?style=for-the-badge">
    </a>
    <a href="https://github.com/spacelab-ufsc/catarina-a1-doc/blob/main/LICENSE">
        <img src="https://img.shields.io/github/license/spacelab-ufsc/catarina-a1-doc?style=for-the-badge" alt="License">
    </a>
</p>

<p align="center">
    <a href="#overview">Overview</a> •
    <a href="#dependencies">Dependencies</a> •
    <a href="#building">Building</a> •
    <a href="#license">License</a>
</p>

## Overview

This repository contains the Critical Design Review (CDR) documentation for Catarina-A1, a 2U CubeSat developed by SpaceLab at the Federal University of Santa Catarina (UFSC). Catarina-A1 is part of Fleet A of the Catarina Constellation and demonstrates the collection and relay of environmental data from Data Collection Platforms (DCPs).

The document covers the mission, system design, subsystems, ground segment, technical budgets, integration and testing, and project management.

## Dependencies

The following dependencies are required to build the documentation:

* A LaTeX distribution, such as [TeX Live](https://www.tug.org/texlive/)
* [latexmk](https://ctan.org/pkg/latexmk)
* GNU Make

## Building

After installing the required dependencies, build the PDF with:

```
make
```

The generated document is saved in the `build/` directory.

## License

This documentation is licensed under the [Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nc-nd/4.0/).
