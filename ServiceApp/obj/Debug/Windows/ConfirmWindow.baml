   M S B A M L   `   `   `  ����E  AServiceApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:ServiceApp
ServiceApp  5   	       ServiceApp.ConfirmWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:ServiceApp     5   	     � Title$   Подтверждение��5   	   $	��165��6   $	��380��6,   .��5	      �  � RowDefinitions 5
   
   �� 5      6   �� 5      6   �� 5      6   .+�5   
   	� -   5         	�Name$$ notIncludedProducrsRadioButton��5      $��0��6?   $
��20,0q�6L   $��Center=�6Z   $��Удалить товар��6u    d� 	IsChecked$
 TrueY�6�   6�   	� 5   
   -   5        $! includedProductsRadioButton��5      $��1��6<   $
��20,0q�6I   $��Center=�6W   $P��JУдалить товар с приклепленными товарами��6r   6�   � 5   
   $��2��6    � ColumnDefinitions 5      �� 5      6%   �� 5      6%   .+�5      �� -   5        $��30,10q�5      $��0��6$   $��Удалить��64   6c   �� 5      -   5        $��30,10q�5      $��1��6$   $��Отмена��64   6a   5      5      5      