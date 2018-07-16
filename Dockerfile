FROM 2123io/hex:test1

COPY ./services ./
COPY ./Hexfile.yml .

CMD ["./hex-exe"]
