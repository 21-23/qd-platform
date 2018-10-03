FROM 2123io/hex:1.0.0

COPY ./services ./
COPY ./Hexfile.yml .

CMD ["./hex-exe"]
