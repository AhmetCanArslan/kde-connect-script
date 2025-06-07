#!/bin/bash

# Seçilen her dosya için döngü
for dosya in "$@"; do
  # Dosya adını al ve .pptx uzantısını .pdf olarak değiştir
  pdf_dosya="${dosya%.pptx}.pdf"

  # LibreOffice ile dönüştürme işlemini yap
  soffice --headless --convert-to pdf "$dosya" --outdir "$(dirname "$dosya")"

  # Başarılı dönüşüm mesajı (isteğe bağlı)
  echo "Dönüştürülen: $dosya -> $pdf_dosya"
done

exit 0

