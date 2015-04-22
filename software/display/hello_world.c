#include "altera_up_avalon_character_lcd.h"

#include "sys/alt_stdio.h"

/********************************************************************************
 * This program demonstrates use of the media ports in the DE2 Media Computer
 *
 * It performs the following:
 *  	1. records audio for about 10 seconds when KEY[1] is pressed. LEDG[0] is
 *  	   lit while recording
 * 	2. plays the recorded audio when KEY[2] is pressed. LEDG[1] is lit while
 * 	   playing
 * 	3. Draws a blue box on the VGA display, and places a text string inside
 * 	   the box
 * 	4. Shows a text message on the LCD display
 * 	5. Displays the last three bytes of data received from the PS/2 port
 * 	   on the HEX displays on the DE2 board
********************************************************************************/
int main(void)
{
	alt_up_character_lcd_dev *lcd_dev;

	/* create a message to be displayed on the VGA and LCD displays */
	char text_top_row[40] = "Senor Hop\0";
	char text_bottom_row[40] = "Get Some\0";

	/* output text message to the LCD */
	lcd_dev = alt_up_character_lcd_open_dev ("/dev/Char_LCD_16x2");
	if (lcd_dev == NULL)
	{
		alt_printf ("Error: could not open character LCD device\n");
		return -1;
	}
	else
		alt_printf ("Opened character LCD device\n");
	alt_up_character_lcd_set_cursor_pos (lcd_dev, 0, 0);	// set LCD cursor location to top row
	alt_up_character_lcd_string (lcd_dev, text_top_row);
	alt_up_character_lcd_set_cursor_pos (lcd_dev, 0, 1);	// set LCD cursor location to bottom row
	alt_up_character_lcd_string (lcd_dev, text_bottom_row);
	alt_up_character_lcd_cursor_off (lcd_dev);				// turn off the LCD cursor

}
