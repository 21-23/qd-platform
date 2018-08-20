FROM 2123io/hex:test3

COPY ./services ./
COPY ./Hexfile.yml .

CMD ["./hex-exe"]
