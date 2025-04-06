import xlwings as xw
import pandas as pd

def main():
    # Aktif çalışma kitabına bağlan
    wb = xw.Book.caller()
    # Aktif sayfayı al
    sheet = wb.sheets.active

    # Veriyi oku
    data = sheet.range('A1').expand().options(pd.DataFrame, index=False).value
    # Örneklem oluştur (örneğin, verinin %10'u)

    sample = data.sample(frac=0.1, random_state=1)
    
    # 'Orneklem' adında yeni bir sayfa ekleyin veya mevcutsa üzerine yazın
    if 'Orneklem' in [s.name for s in wb.sheets]:
        new_sheet = wb.sheets['Orneklem']
        new_sheet.clear()  # Mevcut veriyi temizle
    else:
        new_sheet = wb.sheets.add('Orneklem')

    # Örneklemi yeni sayfaya yaz
    new_sheet.range('A1').value = sample