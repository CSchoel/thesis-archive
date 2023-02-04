#
# SiliconHeart heart rate simulation
# Copyright (C) 2013 Daniel Otto and Andreas Dominik, THM University of Applied Sciences, Giessen, Germany
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#  
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
# 
#options(echo=TRUE, verbose=TRUE)
library(gplots)

name <- commandArgs(TRUE)[1]
name.dat <- paste(name, "000.phi", sep="")
name.hrv <- paste(name, "000.hrv", sep="")
name.pdf <- paste(name, ".pdf", sep="")
name.log <- paste(name, ".log", sep="")

hrv <- read.table(name.hrv, header=TRUE)

# plot log:
all.lines <- paste(readLines(name.log), collapse="\n")

pdf(name.pdf, paper="a4r")
textplot( all.lines, cex=0.7)
title(paste( "Results of Silicon Heart Simulation Model shm1", 
             "\n", "Job name:", name, sep=" "))

# plot complete time:
plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
		main=paste("Heart-Rate Variablility", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

# plot in 3 parts:
x.size <- length(hrv$"hrv")/3

par(mfrow=c(3,1))
plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(0,x.size),
		main=paste("Heart-Rate Variablility", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(x.size, 2*x.size),
		xlab="Heart beat number", ylab="heart beat interval [ms]")

plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
                xlim=c(2*x.size, length(hrv$"hrv")),
		xlab="Heart beat number", ylab="heart beat interval [ms]")

# plot complete time:
plot(hrv$"hrv", type="l", col="red", ylim=c(400,1400),
		main=paste("Heart-Rate Variablility", name, sep=" "), 
		xlab="Heart beat number", ylab="heart beat interval [ms]")

dev.off()



