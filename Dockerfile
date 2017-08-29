#robotone is currently build-able under GHC 7.8.3. Updating GHC will break the build.
FROM haskell:7.8

WORKDIR /source

ADD . /source

# # Warning: Take a much longer time to build tex into the Docker image
# RUN apt-get update -q && apt-get install -qy \
#    texlive-full 


# Requires Haskell packages
RUN cabal update && cabal install --global \
	QuickCheck \
	logict-0.6.0.2 \
	parsec

RUN runhaskell Setup.lhs configure --user

# RUN runhaskell Setup.lhs build

# RUN ghc --make /source/src/*.hs

# CMD ["bash", "run.sh"]

#ENTRYPOINT ["ghci"]
