# Pull base image
FROM debian:wheezy

# Install XeTeX
RUN \
    echo "===> Update repositories" && \
    apt-get update && \
    \
    \
    echo "===> Install XeTeX" && \
    DEBIAN_FRONTEND=noninteractive apt-get --no-install-recommends install -y --force-yes \
        texlive-xetex \
        texlive-latex-recommended \
        latex-xcolor \
        texlive-latex-extra 
	lmodern && \
    \
    \
    echo "===> Clean up" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Default command
CMD ["xelatex"]
