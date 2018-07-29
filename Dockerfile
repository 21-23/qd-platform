FROM 2123io/hex:test2

COPY ./services ./
COPY ./Hexfile.yml .

CMD ["./hex-exe"]
