head(HairEyeColor)

mosaicplot(HairEyeColor, main = 'Hair Eye Color', color = c('red', 'green'), off = 1)
# 금발 파란 눈동자는 남자보다 여자가 많다. 등등

santa <- data.frame(belief = c('no belief', 'no belief', 'no belief', 'no belief',
                                'belief', 'belief', 'belief', 'belief',
                                'belief', 'belief', 'no belief', 'no belief',
                                'belief', 'belief', 'no belief', 'no belief'),
                    sibling = c('older brother', 'older brother', 'older brother', 'older sister',
                                'no older sibling', 'no older sibling', 'no older sibling',
                                'older sister', 'older brother', 'older sister', 'older brother',
                                'older sister', 'no older sibling', 'older sister', 'older brother',
                                'no older sibling'))
mosaicplot(~belief + sibling, data = santa, main = 'Santa', color = c('red', 'green'), off = 1)
# older brother가 있으면 santa를 믿지 않는 경향이 크다. 