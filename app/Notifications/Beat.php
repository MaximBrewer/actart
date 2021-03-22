<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class Beat extends Notification
{
    use Queueable;

    protected $lot;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($lot)
    {
        $this->lot = $lot;
        //
    }
    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Act-Art.ru - ставка перебита') // Тема письма
            ->greeting("Ваша ставка перебита.") // Заголовок в теле письма
            ->line('В Галерее ACT-ART ваша ставка в лоте ' . $this->lot->title . ' была перебита.') // Абзац в теле письма
            ->action('Сделать ответную ставку', "https://act-art.ru/gallery/lot/" . $this->lot->id); // Кнопка в теле письма
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
