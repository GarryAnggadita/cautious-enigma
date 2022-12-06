# December 6th,2022
# Garry Anggadita
# Version 1

KulonProgo_1 <- read_csv("Kulon_Progo_KebutuhanAir.csv")
KulonProgo_1$DESA <- NULL
KulonProgo_1$NO <- NULL
Test <- as_data_frame(t(KulonProgo_1))
rownames(Test) <- c("PDAM","SUMUR","MATA_AIR","SUMUR_BOR","AIR_HUJAN","AIR_ISI_ULANG")
colnames(Test) <- c("DESA_JANGKARAN","DESA_SINDUTAN","DESA_PALIHAN","DESA_GLAGAH",
                    "DESA_KALIDENGEN","DESA_PLUMBON","DESA_KEDUNDANG","DESA_DEMEN",
                    "DESA_KULUR","DESA_KALIGINTUNG","DESA_TEMON_WETAN","DESA_TEMON_KULON",
                    "DESA_KEBONREJO","DESA_JANTEN","DESA_KARANG_WULUH","JUMLAH")

Test <- Test %>%
  mutate(Test, PERSEN_JUMLAH = JUMLAH / sum(JUMLAH)*100)

Test_2 <- cbind(Test, Sumber_Air)
Sumber_Air <- c("PDAM","SUMUR","MATA_AIR","SUMUR_BOR","AIR_HUJAN","AIR_ISI_ULANG")
Test_2 <- cbind(Test, Sumber_Air)

ggplot(Test_2, aes(x="", y=PERSEN_JUMLAH, fill=Sumber_Air)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) + theme_void()
ggplot(Test_2, aes(x="", y=PERSEN_JUMLAH, fill=Sumber_Air)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) + theme_void() + labs(title = "Sumber Air Warga Kabupaten Kulon Progo")
