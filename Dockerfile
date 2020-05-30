FROM 2123io/hex:1.1.2

COPY ./services ./

CMD ["./hex-exe"]
