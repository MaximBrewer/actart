<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class AuctionWinner extends Notification
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
            ->subject('Act-Art.ru - поздравляем с покупкой')
            ->greeting("Поздравляем с покупкой на аукционе ACT-ART!")
            ->line('Вы купили ' . $this->lot->title . ' за сумму ' . $this->lot->bets[0]->bet . '$')
            ->line('В ближайшее время с вами свяжется менеджер для обсуждения дальнейших действий.')
            ->line('Все выигранные лоты Вы можете посмотреть в своём профиле.')
            ->action('Перейти к профилю', "https://act-art.ru/profile");
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
