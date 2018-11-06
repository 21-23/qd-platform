FROM 2123io/hex:1.0.0

COPY ./services ./

CMD ["./hex-exe"]
